let
  inherit (builtins)
    all
    any
    attrNames
    elemAt
    filter
    foldl'
    getAttr
    head
    isAttrs
    isList
    isString
    length
    match
    replaceStrings
    ;

  assertMsg = cond: msg: (!cond) -> throw msg;

  eq = a: b: a == b;
  flip =
    f: b: a:
    f a b;
  swap = x: f: f x;
  turn =
    f: g: x:
    f (g x);

  #?~ turn2 = f: g: x: y: f (g x y);
  turn2 = turn turn turn;

  hasAttr = s: set: (isAttrs set) && (builtins.hasAttr s set);
  allPredicates = flip (turn all swap);
  anyPredicates = flip (turn any swap);

  isFunction = anyPredicates [
    builtins.isFunction

    (allPredicates [
      isAttrs
      (hasAttr "__functor")
      (turn builtins.isFunction (getAttr "__functor"))
    ])
  ];

  isPlaceholder = turn (eq [ ]) (match "^<.*>$");
  split = turn2 (filter isString) builtins.split;
  splitPlaceholders = turn (split ">?\\.<|>\\.") (replaceStrings [ "<" ">" ] [ "<<" ">>" ]);

  splitAttrPath =
    let
      matchQuote = match ''^"(.*)"$'';
      unquote =
        maybe-quoted:
        let
          result = matchQuote maybe-quoted;
        in
        if result != null then elemAt result 0 else maybe-quoted;
    in
    turn (map unquote) (split "\\.");

  processAttrPath =
    let
      applySplit = x: if isPlaceholder x then x else splitAttrPath x;

      #?~ getAttrByPath = path: attrs: foldl' (set: s: getAttr s set) attrs path;
      getAttrByPath = flip (foldl' (flip getAttr));

      resolvePlaceholder =
        placeholder-name: attrs:
        let
          names = attrNames attrs;
          name = head names;
          value = getAttr name attrs;
        in
        assert assertMsg (
          length names > 0
        ) "An option has no values for '${placeholder-name}' to resolve to";

        builtins.trace "${placeholder-name} -> ${name}" value;

      applyPath =
        path-component:
        if isList path-component then getAttrByPath path-component else resolvePlaceholder path-component;
    in
    path-str:
    let
      stage1 = splitPlaceholders path-str;
      stage2 = map applySplit stage1;

      result = map applyPath stage2;
    in
    assert (all isFunction result);
    result;
in
#?~ path: attrs: foldl' swap attrs (processAttrPath path);
turn (flip (foldl' swap)) processAttrPath
