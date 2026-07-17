{ lib, ... }:
lib.nixvim.plugins.mkNeovimPlugin {
  name = "mesone";
  package = "mesone-nix";

  # TODO provide an example for the `settings` option (or remove entirely if there is no useful example)
  # NOTE you can use `lib.literalExpression` or `lib.literalMD` if needed
  settingsExample = {
    foo = 42;
    bar.__raw = "function() print('hello') end";
  };
}
