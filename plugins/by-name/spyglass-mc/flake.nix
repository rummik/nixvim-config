{
  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixpkgs-lib.follows = "flake-parts/nixpkgs-lib";

    nixpkgs.url = "github:NixOS/nixpkgs/25.11";

    spyglass-mc = {
      url = "github:MaxTheMooshroom/spyglass-mc";
      flake = false;
    };

    flake-module = {
      url = ./flake-module.nix;
      flake = false;
    };

    nixvim-module = {
      url = ./nixvim-module.nix;
      flake = false;
    };
  };

  outputs =
    { nixpkgs-lib, flake-parts, ... }@inputs:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = nixpkgs-lib.lib.systems.flakeExposed;

      imports = [
        flake-parts.flakeModules.flakeModules

        inputs.flake-module.outPath
      ];
    };
}
