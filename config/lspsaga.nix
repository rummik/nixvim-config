{

  config.plugins.lsp.enable = true;
  config.plugins.lsp.servers.nil_ls.enable = true;
  # config.plugins.lsp.servers.nixd.enable = true;

  config.plugins.lspsaga = {
    enable = true;

    symbolInWinbar = {
      enable = false;
    };

    lightbulb = {
      sign = false;
    };

    ui.codeAction = " "; # 󰌵"; #󰌶󱠂";

    scrollPreview = {
      scrollDown = "<C-j>";
      scrollUp = "<C-k>";
    };
  };

  config.keymaps = [
    { key = "gh";         action = "<cmd>Lspsaga lsp_finder<CR>";      mode = [ "n" ]; }
    { key = "gr";         action = "<cmd>Lspsaga rename<CR>";          mode = [ "n" ]; }
    { key = "gd";         action = "<cmd>Lspsaga peek_definition<CR>"; mode = [ "n" ]; }
    { key = "<leader>ca"; action = "<cmd>Lspsaga code_action<CR>";                     }
    { key = "<A-d>";      action = "<cmd>Lspsaga term_toggle<CR>";                     }
    { key = "<A-d>";      action = "<cmd>Lspsaga term_toggle<CR>";     mode = [ "t" ]; }
  ];
}
