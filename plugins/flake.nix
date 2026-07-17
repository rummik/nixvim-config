{
  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixpkgs-lib.follows = "flake-parts/nixpkgs-lib";

    nvim-lspconfig.url = "github:MaxTheMooshroom/nvim-lspconfig";
  };

  outputs =
    { nixpkgs-lib, flake-parts, ... }@inputs:
    flake-parts.lib.mkFlake { inherit inputs; } {
      imports = [ ];
    };
}
