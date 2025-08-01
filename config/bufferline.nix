{
  config = {
    plugins.bufferline = {
      enable = true;

      settings.options = {
        themable = true;
        color_icons = false;
        persist_buffer_sort = true;
        move_wraps_at_ends = true;

        # indicator.style = "underline";
        hover.enabled = true;

        /* numbers.__raw = ''
          function(opts)
            return string.format('%s·%s', opts.raise(opts.id), opts.lower(opts.ordinal))
          end
        ''; */

        # button = "󰅙";
        # button = "󰅚";
        # modified.button = "󰀨";
        # inactive.modified.button = "󰗖";

        #"" "" "" "" "" ""
        separator_style = "slope";
        # separator_style = [ "" "" ];
        close_icon = "󰅚";
        buffer_close_icon = "󰅙";
        modified_icon = "󰀨";
        # style_preset = ["no_bold" "no_italic"];
      };

      settings.options.groups = {
        options.toggile_hidden_on_enter = true;
        items = [
          { __raw = ''require('bufferline.groups').builtin.pinned:with({ icon = "" })''; }
          { __raw = ''require('bufferline.groups').builtin.ungrouped''; }
          {
            name = " Tests";
            highlight = { sp = "#adbaff"; }; # Optional
            # priority = 2; # determines where it will appear relative to other groups (Optional)
            # icon = ""; # Optional
            matcher.__raw = ''
              function(buf) -- Mandatory
                return
                  buf.name:match('_test') or
                  buf.name:match('_spec') or
                  buf.name:match('%.test') or
                  buf.name:match('%.spec')
              end
            '';
            separator = { # Optional
              style.__raw = ''require('bufferline.groups').separator.pill'';
            };
          }
          {
            name = "󰧮 Docs";
            highlight = { sp = "#88e027"; };
            # icon = "󰧮";
            auto_close = false;  # whether or not close this group if it doesn't contain the current buffer
            matcher.__raw = ''
              function(buf)
                return
                  buf.name:match('%.md') or
                  (buf.name:match('%.txt') and not (
                    buf.name:match('CMake.+%.txt')
                  ))
              end
            '';
            separator = { # Optional
              style.__raw = ''require('bufferline.groups').separator.pill'';
            };
          }
          {
            name = " Notes";
            highlight = { sp = "#fee900"; }; # Optional
            # priority = 2; # determines where it will appear relative to other groups (Optional)
            #     󰺿
            # icon = ""; # Optional
            matcher.__raw = ''
              function(buf) -- Mandatory
                return
                  buf.path:match('^/home/[^/]+/Notes') or
                  buf.path:match('^~/Notes')
              end
            '';
            separator = { # Optional
              style.__raw = ''require('bufferline.groups').separator.pill'';
            };
          }
        ];
      };
    };

    keymaps = [
      # Reordering tabs
      { mode = [ "n" ]; key = "<M-S-j>"; action.__raw = "function() require('bufferline').move(1) end";             }
      { mode = [ "n" ]; key = "<M-S-k>"; action.__raw = "function() require('bufferline').move(-1) end";            }
      { mode = [ "n" ]; key = "<M-p>";   action.__raw = "function() require('bufferline').groups.toggle_pin() end"; }

      # Navigating tabs
      { mode = [ "n" ]; key = "<M-j>";   action.__raw = "function() require('bufferline').cycle(1) end";            }
      { mode = [ "n" ]; key = "<M-k>";   action.__raw = "function() require('bufferline').cycle(-1) end";           }
      { mode = [ "n" ]; key = "<M-1>";   action.__raw = "function() require('bufferline').go_to(1) end";            }
      { mode = [ "n" ]; key = "<M-2>";   action.__raw = "function() require('bufferline').go_to(2) end";            }
      { mode = [ "n" ]; key = "<M-3>";   action.__raw = "function() require('bufferline').go_to(3) end";            }
      { mode = [ "n" ]; key = "<M-4>";   action.__raw = "function() require('bufferline').go_to(4) end";            }
      { mode = [ "n" ]; key = "<M-5>";   action.__raw = "function() require('bufferline').go_to(5) end";            }
      { mode = [ "n" ]; key = "<M-6>";   action.__raw = "function() require('bufferline').go_to(6) end";            }
      { mode = [ "n" ]; key = "<M-7>";   action.__raw = "function() require('bufferline').go_to(7) end";            }
      { mode = [ "n" ]; key = "<M-8>";   action.__raw = "function() require('bufferline').go_to(8) end";            }
      { mode = [ "n" ]; key = "<M-9>";   action.__raw = "function() require('bufferline').go_to(9) end";            }
      { mode = [ "n" ]; key = "<M-0>";   action.__raw = "function() require('bufferline').go_to(-1) end";           }

      # Close tab
      { mode = [ "n" ]; key = "<M-x>";   action.__raw = "function() require('bufferline').unpin_and_close() end";   }
    ];
  };
}
