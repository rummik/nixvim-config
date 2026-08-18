{
  lib,
  inputs,
  options,
  ...
}:
let
  inherit (lib) mkOption types;
  inherit (inputs) nixvim;
in
{
  imports = [
    inputs.nixvim.flakeModule

    ./config
  ];

  options.nixpkgs.allowUnfree = lib.mkEnableOption "nixpkgs.allowUnfree";

  options = {
    nixvimConfigurations = mkOption {
      type = types.attrsOf types.deferredModule;
    };
  };

  config.nixvimConfigurations = [ ./nvim-profile.nix ];

  config.nixvim = {
    packages = {
      enable = true;
      nameFunction = name: if name == "default" then "nvim" else "nvim-" + name;
    };

    checks = {
      enable = true;
      nameFunction = name: "nixvim-${name}-test";
    };
  };

  config.perSystem =
    {
      system,
      self',
      pkgs,
      ...
    }:
    let
      inherit (self'.packages) nvim;

      nvimpager' = pkgs.nvimpager.override { neovim = nvim; };
      nvimpager = nvimpager'.overrideAttrs (
        final: prev: {
          # doCheck = false;
        }
      );
    in
    {
      _module.args.nixpkgs =
        (import inputs.nixpkgs)
          {
            overlays = [];
            allowUnfree = options.nixpkgs.allowUnfree.value;
          };

      nixvimConfigurations.default =
        nixvim.lib.evalNixvim
          {
            inherit system;

            modules =
              options.nixvimProfiles.value
            ++
              [
                ./nvim-profile.nix
                { nixpkgs.pkgs = pkgs; }
              ];
          };

      packages =
        {
          default = nvim;

          inherit nvimpager;
        };

      
    };
}
