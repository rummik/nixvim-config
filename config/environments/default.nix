{ lib, ... }:
let
  inherit (lib) mkOption types;

  swap = x: f: f x;

  allPredicates = preds: item: builtins.all (swap item) preds;

  environments =
    with builtins;
    let
      environments' = lib.filter (allPredicates [
        ({ value, ... }: value == "regular")
        ({ name, ... }: lib.hasSuffix ".nix" name)
      ]) (lib.attrsToList (readDir ./.));
    in
    map ({ name, ... }: lib.removeSuffix ".nix" name) environments';

  environment = types.coercedTo (types.addCheck types.str (lib.flip builtins.elem environments)) (
    x: ./. + "/${x}.nix"
  ) types.pathInStore;
in
{
  imports = [ ];

  options = {
    nixvimEnvironments = mkOption {
      type = types.listOf environment;
    };
  };

  config = { };
}
