{
  config.plugins.transparent = {
    # enable = true;

    luaConfig.post = ''
      -- require('transparent').clear_prefix('BufferLine')
      -- require('transparent').clear_prefix('lualine_c')
      -- require('transparent').clear_prefix('lualine_transitional_lualine_b')
      -- require('transparent').clear_prefix('lualine_x_filetype')
    '';

    settings.extra_groups = [
      # "BufferTabpageFill"
      # "NotifyBackground"
    ];

    settings.exclude_groups = [
      "NotifyBackground"
      "BufferLine"
      "StatusLine"
      "BufferCurrent"
    ];
  };
}
