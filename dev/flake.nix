{
  description = "Private inputs for development purposes. These are used by the top level flake in the `dev` partition, but do not appear in consumers' lock files.";

  inputs = {
    devenv.url = "github:cachix/devenv";
    nix2container.url = "github:nlewo/nix2container";
    # See https://github.com/ursi/get-flake/issues/4
    nix2container.inputs.nixpkgs.follows = "";
    mk-shell-bin.url = "github:rrbutani/nix-mk-shell-bin";
    haumea.url = "github:nix-community/haumea/v0.2.2";
    # See https://github.com/ursi/get-flake/issues/4
    haumea.inputs.nixpkgs.follows = "";
  };

  nixConfig = {
    extra-trusted-public-keys = "devenv.cachix.org-1:w1cLUi8dv3hnoSPGAuibQv+f9TZLr6cv/Hm9XgU50cw=";
    extra-substituters = "https://devenv.cachix.org";
  };

  # This flake is only used for its inputs.
  outputs = _: { };
}
