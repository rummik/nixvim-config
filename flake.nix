{
  description = "Maxine's Neovim configuration";

  inputs =
    {
      # nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
      nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";

      flake-parts.url = "github:hercules-ci/flake-parts";
      flake-parts.inputs.nixpkgs-lib.follows = "nixpkgs";

      # nixvim.url = "github:nix-community/nixvim/nixos-25.11";
      nixvim.url = "github:nix-community/nixvim/nixos-26.05";
      nixvim.inputs.flake-parts.follows = "flake-parts";
      nixvim.inputs.nixpkgs.follows = "nixpkgs";

      spyglassmc.url = "github:MaxTheMooshroom/SpyglassMC.nix";
      spyglassmc.inputs.flake-parts.follows = "flake-parts";
      spyglassmc.inputs.nixpkgs.follows = "nixpkgs";
    };

  outputs =
    { flake-parts, ... }@inputs:
    flake-parts.lib.mkFlake
      { inherit inputs; }
      (
        { lib, ... }:
        {
          systems = lib.systems.flakeExposed;

          imports = [ ./flake-module.nix ];

          nixpkgs.allowUnfree = true;

          nixvimEnvironments =
            [
              "rust"
              "cpp"
              # "java"
              "spyglass"
              "typescript"
              "python"
              "docker"
              # "godot"
            ];
        }
      );
}
