{ inputs, ... }:
{ config, ... }: {
  config.plugins = {
    # dap-lldb.enable = true;
    neotest.adapters.rust.enable = config.plugins.neotest.enable;
    # cmp-clippy.enable = true;
    # crates.enable = true;
    rustaceanvim.enable = true;
  };
}
