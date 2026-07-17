{ pkgs, lib, ... }:
{
  config.plugins = {
    lsp.servers = {
      spyglass-mc.enable = true;
      mcfunction.enable = true;
    };

    # spyglass-mc.package = pkgs.minecraft-utils.lang-servers.spyglass;
    # mcfunction.package = pkgs.minecraft-utils.lang-servers.mcfunction;

    package-info = {
      enable = true;
      enableTelescope = true;
      settings.package_manager = lib.mkDefault "npm";
    };
  };

  # config.
}
