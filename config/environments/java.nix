{ inputs, ... }:
{ config, pkgs, ... }:
{
  # config.plugins.lsp.servers.jdtls = {
  #   enable = true;
  #   extraConfigLua = ''
  #     require('lspconfig').jdtls.setup({
  #       path = "${pkgs.jdk21_headless}/lib/openjdk/";
  #     })
  #   '';
  # };
}
