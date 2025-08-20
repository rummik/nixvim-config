{
  config.plugins = {
    # typescript-tools.enable = true;

    neotest.adapters = {
      jest.enable = true;
      # deno.enable = true;
      vitest.enable = true;
      # playwright.enable = true;
    };

    lsp.servers = {
      html.enable = true;
      cssls.enable = true;
      jsonls.enable = true;
      eslint.enable = true;
      # ts_ls.enable = true;
      vtsls.enable = true;
      # denols.enable = true;
    };
  };

  config.keymaps = [
    {
      mode = ["n"];
      key = "<leader>twr";
      action = "<cmd>lua require('neotest').run.run({ vitestCommand = 'vitest --watch' })<cr>";
      options.desc = "Run Watch";
    }
    {
      mode = ["n"];
      key = "<leader>twhr";
      action = "<cmd>lua require('neotest').run.run({ vitestCommand = 'vitest --watch --browser.headless' })<cr>";
      options.desc = "Run Watch Headless";
    }
    {
      mode = ["n"];
      key = "<leader>twf";
      action = "<cmd>lua require('neotest').run.run({ vim.fn.expand('%'), vitestCommand = 'vitest --watch' })<cr>";
      options.desc = "Run Watch File";
    }
    {
      mode = ["n"];
      key = "<leader>twhf";
      action = "<cmd>lua require('neotest').run.run({ vim.fn.expand('%'), vitestCommand = 'vitest --watch --browser.headless' })<cr>";
      options.desc = "Run Watch File Headless";
    }
  ];
}
