{ inputs, ... }:
{ lib, pkgs, ... }:
{
  config = {
    extraPackages =
      with pkgs;
      [
        coreutils
        lldb
      ]
      ++ lib.optionals stdenv.hostPlatform.isLinux [
        gdb
      ];

    plugins = {
      lsp.enable = true;
      clangd-extensions.enable = true;

      lsp.servers.clangd = {
        enable = true;
        autostart = true;

        settings.init_options = {
          usePlaceholders = true;
          completeUnimported = true;
          clangdFileStatus = true;
        };

        cmd = [
          "clangd"
          "--clang-tidy"
          "--background-index"
        ];
      };
    };
  };
}
