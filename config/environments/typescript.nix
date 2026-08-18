{ inputs, ... }:
{ config, lib, ... }: {
  config.plugins = {
    typescript-tools.enable = true;

    neotest.adapters = {
      jest.enable = config.plugins.neotest.enable;
      # deno.enable = config.plugins.neotest.enable;
      vitest.enable = config.plugins.neotest.enable;
      # playwright.enable = config.plugins.neotest.enable;
    };

    lsp.servers = {
      html.enable = true;
      cssls.enable = true;
      jsonls.enable = true;
      # eslint.enable = true;
      oxlint.enable = true;
      # ts_ls.enable = true;
      # vtsls.enable = true;
      # denols.enable = true;
    };

    package-info = {
      enable = true;
      enableTelescope = true;
      settings.package_manager = "pnpm";
    };
  };

  config.keymaps = lib.mkIf config.plugins.neotest.enable [
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
