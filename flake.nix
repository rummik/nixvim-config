{
  description = "*Kim's Neovim configuration flake";

  inputs = {
    devenv-root = {
      url = "file+file:///dev/null";
      flake = false;
    };

    nixpkgs.url = "github:cachix/devenv-nixpkgs/rolling";
    nixvim.url = "github:nix-community/nixvim";
    nixvim.inputs.nixpkgs.follows = "nixpkgs";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs = inputs@{ self, flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; }
      ({ withSystem, flake-parts-lib, ... }:
        let

          inherit (flake-parts-lib) importApply;

          nixvimModules = {
            default = ./config;
            typescript = ./config/environments/typescript.nix;
            obsidian = ./config/environments/obsidian.nix;
          };

          flakeModules.default = importApply ./flake-module.nix {
            inherit withSystem;
            inherit nixvimModules;
            inputs.nixvim = inputs.nixvim;
          };

          nixvimConfig = options@{ system, modules ? [], ... }:
            inputs.nixvim.lib.evalNixvim (
              options // {
                modules = modules ++ [
                  nixvimModules.default
                  nixvimModules.typescript
                ];
              }
            );

        in

        {
          imports = [
            flakeModules.default
            inputs.flake-parts.flakeModules.partitions
          ];

          # systems = inputs.nixpkgs.lib.systems.flakeExposed;
          systems = [ "x86_64-linux" "i686-linux" "x86_64-darwin" "aarch64-linux" "aarch64-darwin" ];

          perSystem = { config, self', inputs', pkgs, system, ... }: {
            # Per-system attributes can be defined here. The self' and inputs'
            # module parameters provide easy access to attributes of the same
            # system.

            nixvimConfigurations = {
              default = nixvimConfig {
                inherit system;
              };
            };

            packages = {
              default = self'.packages.nvim;
              nvimpager = pkgs.nvimpager.override {
                neovim = self'.packages.nvim;
              };
            };
          };

          flake = {
            # The usual flake attributes can be defined here, including system-
            # agnostic ones like nixosModule and system-enumerating ones, although
            # those are more easily expressed in perSystem.

            inherit flakeModules;
            inherit nixvimModules;

            lib = {
              nixvimConfig = nixvimConfig;
            };
          };

          partitionedAttrs = {
            devShells = "dev";
          #templates = "dev";
          };

          partitions.dev = {
            extraInputsFlake = ./dev;

            module = { inputs, ... }: {
              imports = [ inputs.devenv.flakeModule ];

              perSystem = { config, self', inputs', pkgs, system, ... }: {
                devenv.shells.default = {
                  name = "nixvim-config";

                  # https://devenv.sh/reference/options/
                  packages = [
                    config.packages.default
                  ];

                  languages.nix.enable = true;

                  git-hooks.hooks = {
                    markdownlint = {
                      enable = true;
                      settings.configuration = {
                        MD013.line_length = 120;
                      };
                    };

                    nil.enable = true;
                  };
                };
              };

#              flake.templates = inputs.haumea.lib.load {
#                src = ./templates;
#                loader = [({ matches = _: false; })];
#
#                transformer = cursor: mod:
#                  if builtins.length cursor > 0 then
#                    ./. + "/${builtins.head cursor}"
#                  else
#                    mod;
#              };
            };
          };
        }
      );
}
