{ inputs, ... }:
{
  config.plugins = {
    lsp.servers.dockerls.enable = true;
  };
}
