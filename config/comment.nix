{
  config.plugins.ts-context-commentstring.enable = true;
  config.plugins.ts-comments.enable = true; # Treesitter comment extensions

  config.plugins.comment = {
    enable = true;
    settings.pre_hook = /* lua */ ''
      require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook()
    '';
  };

  # Neovim seems to register <C-/> as <C-_>
  config.keymaps = [
    { mode = [ "n" ]; key = "<C-_>"; action = "<Plug>(comment_toggle_linewise_current)"; }
    { mode = [ "v" ]; key = "<C-_>"; action = "<Plug>(comment_toggle_linewise_visual)";  }
    { mode = [ "n" ]; key = "<C-/>"; action = "<Plug>(comment_toggle_linewise_current)"; }
    { mode = [ "v" ]; key = "<C-/>"; action = "<Plug>(comment_toggle_linewise_visual)";  }
  ];
}
