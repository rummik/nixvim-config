{ inputs, ... }:
{ pkgs, lib, ... }:
let
  system = pkgs.stdenv.buildPlatform.system;
in
{
  config.plugins = {
    lsp.servers = {
      jsonls.enable = true;
      spyglassmc_language_server =
        {
          enable = true;
          package = inputs.spyglassmc.packages.${system}.default;
          rootMarkers = [ "pack.mcmeta" ];
          filetypes =
            [
              "mcmeta"
              "json"
              "mcfunction"
              "snbt"
              "mcdoc"
            ];
        };
    };
  };

  # config.
}
