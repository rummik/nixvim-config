{
  config.plugins.trouble.enable = true;

  config.keymaps = [
    # { key = "<leader>xx"; action = "<cmd>Trouble diagnostics toggle filter.buf=0<cr>"; }
    {
      key = "<leader>xX";
      action = "<cmd>Trouble diagnostics toggle<cr>";
    }
    {
      key = "<leader>xx";
      action = "<cmd>Trouble diagnostics toggle filter.buf=0<cr>";
    }
    {
      key = "<leader>cs";
      action = "<cmd>Trouble symbols toggle focus=false<cr>";
    }
    {
      key = "<leader>cl";
      action = "<cmd>Trouble lsp toggle focus=false win.position=right<cr>";
    }
    {
      key = "<leader>xl";
      action = "<cmd>Trouble loclist toggle<cr>";
    }
    {
      key = "<leader>xq";
      action = "<cmd>Trouble qflist toggle<cr>";
    }
    {
      key = "gR";
      action = "<cmd>Trouble lsp_references<cr>";
    }
  ];
}
