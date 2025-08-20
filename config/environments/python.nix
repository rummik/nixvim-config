{
  config.plugins = {
    dap-python.enable = true;
    neotest.adapters.python.enable = true;

    lsp.servers.pyright.enable = true;
    # lsp.servers.pylsp = {
    #   enable = true;
    #   settings.plugins = {
    #     pylint.enabled = true;
    #     rope.enabled = true;
    #     rope_completion.enabled = true;
    #     pylsp_mypy.enabled = true;
    #   };
    # };
  };
}
