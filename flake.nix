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
    devenv.url = "github:cachix/devenv";
    nix2container.url = "github:nlewo/nix2container";
    nix2container.inputs.nixpkgs.follows = "nixpkgs";
    mk-shell-bin.url = "github:rrbutani/nix-mk-shell-bin";
  };

  nixConfig = {
    extra-trusted-public-keys = "devenv.cachix.org-1:w1cLUi8dv3hnoSPGAuibQv+f9TZLr6cv/Hm9XgU50cw=";
    extra-substituters = "https://devenv.cachix.org";
  };

  outputs = inputs@{ self, flake-parts, devenv-root, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      imports = [
        inputs.devenv.flakeModule
        inputs.nixvim.flakeModules.default
      ];

      # systems = inputs.nixpkgs.lib.systems.flakeExposed;
      systems = [ "x86_64-linux" "i686-linux" "x86_64-darwin" "aarch64-linux" "aarch64-darwin" ];

      nixvim = {
        packages = {
          enable = true;
          nameFunction = name: if name == "default" then "nvim" else "nvim-" + name;
        };

        checks = {
          enable = true;
          nameFunction = name: "nixvim-" + name + "-test";
        };
      };

      perSystem = { config, self', inputs', pkgs, system, ... }: {
        # Per-system attributes can be defined here. The self' and inputs'
        # module parameters provide easy access to attributes of the same
        # system.

        packages = {
          default = self'.packages.nvim;
          nvimpager = pkgs.nvimpager.override {
            neovim = self'.packages.nvim;
          };
        };

        nixvimConfigurations = {
          default = inputs.nixvim.lib.evalNixvim {
            inherit system;
            modules = [
              { _module.args.inputs = inputs'; }
              self.nixvimModules.default
            ];
          };
        };

        devenv.shells.default = {
          name = "nixvim";

          # https://devenv.sh/reference/options/
          packages = [
            config.packages.default
            self'.packages.nvim
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

      flake.nixvimModules = {
        default = ./config;
      };
    };
}
