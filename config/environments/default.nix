{ lib, inputs, ... }:
let
  inherit (lib) mkOption types;

  swap = x: f: f x;
  pipe' = lib.flip lib.pipe;

  allPredicates = preds: item: builtins.all (swap item) preds;

  valid-environments =
    let
      environments' =
        lib.filter
          (
            allPredicates
              [
                ({ value, ... }: value == "regular")
                ({ name, ... }: lib.hasSuffix ".nix" name)
              ]
          )
          (lib.attrsToList (builtins.readDir ./.));
    in
      builtins.map ({ name, ... }: lib.removeSuffix ".nix" name) environments';
in
{
  imports = [ ];

  options = {
    nixvimEnvironments = mkOption {
      type =
        types.coercedTo
          (types.listOf (types.enum valid-environments))
          (pipe'
            [
              lib.unique
              (builtins.map (x: ./. + "/${x}.nix"))
              (builtins.map import)
              (swap { inherit inputs; })
            ]
          )
          (types.listOf types.deferredModule);
    };
  };

  config = { };
}
