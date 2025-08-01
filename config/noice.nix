{
  config.plugins.telescope.enabledExtensions = [ "noice" ];

  /* config.plugins.lualine = {
    settings.sections = {
      lualine_x = [
        {
          __unkeyed-1.__raw = ''require("noice").api.statusline.mode.get'';
          cond.__raw = ''require("noice").api.statusline.mode.has'';
          # color = { fg = "#ff9e64"; };
        }
      ];
    };
  }; */

  config.plugins.noice = {
    enable = true;

    settings = {
      cmdline = {
        enable = true;
        format = {
          # conceal: (default=true) This will hide the text in the cmdline that matches the pattern.
          # view: (default is cmdline view)
          # opts: any options passed to the view
          # icon_hl_group: optional hl_group for the icon
          # title: set to anything or empty string to hide
          cmdline     = { icon = "";   pattern = "^:";                                            lang = "vim";                    };
          search_down = { icon = " "; pattern = "^/";                                            lang = "regex"; kind = "search"; };
          search_up   = { icon = " "; pattern = "^%?";                                           lang = "regex"; kind = "search"; };
          filter      = { icon = "$";   pattern = "^:%s*!";                                        lang = "bash";                   };
          lua         = { icon = "";   pattern = [ "^:%s*lua%s+" "^:%s*lua%s*=%s*" "^:%s*=%s*" ]; lang = "lua";                    };
          help        = { icon = "";   pattern = "^:%s*he?l?p?%s+";                                                                };
          # Used by input()
          input       = { icon = "󰥻 ";  view = "cmdline_input";                                                                     };
          # lua = false, # to disable a format, set to `false`
        };

        messages = {
          # NOTE: If you enable messages; then the cmdline is enabled automatically.
          # This is a current Neovim limitation.
          enabled = true;              # enables the Noice messages UI
          view = "notify";             # default view for messages
          view_error = "notify";       # view for errors
          view_warn = "notify";        # view for warnings
          view_history = "messages";   # view for :messages
          view_search = "virtualtext"; # view for search count messages. Set to `false` to disable
        };

        /*
            cmdline_popup = {
              position = {
              row = 5,
              col = "50%",
            },
            size = {
              width = 60,
              height = "auto",
            },
          },
          popupmenu = {
            relative = "editor",
            position = {
              row = 8,
              col = "50%",
            },
            size = {
              width = 60,
              height = 10,
            },
            border = {
              style = "rounded",
              padding = { 0, 1 },
            },
            win_options = {
              winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
            };
          };
        }; */

        notify = {
          enable = true;
          view = "notify";
        };
      };
    };
  };
}
