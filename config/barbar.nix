{
  config = {
    plugins.barbar = {
      enable = true;
      # auto_hide = true;
      # closeable = false; # Disable close button
      # highlight_alternate = true;
      settings.highlight_alternate = false;
      settings.highlight_inactive_file_icons = false;
      settings.icons = rec {
        # separator = { left = ""; right = ""; };
        separator = { left = ""; right = ""; };
        # separator = { left = ""; right = ""; };

        separator_at_end = false;
        # preset = "slanted";
        button = "󰅙";
        filetype = {
          customColors = false;
          enable = true;
        };
        # current.filetype = filetype;

        modified.button = "󰀨";
        # modified.filetype = filetype;
        alternate.filetype = filetype;

        # inactive.modified.button = "󰗖";
        # inactive.modified = modified;

        inactive = {
          inherit filetype;
          button = "󰅚";
          modified.button = "󰗖";
          separator = { left = ""; right = ""; };
        };

        pinned = {
          button = "";
          filename = true;
        };
      };
    };

    # See: https://github.com/romgrk/barbar.nvim/?tab=readme-ov-file#highlighting
    highlight = rec {
      BufferTabpageFill.bg = "none";
      TabLine.bg = "none";
      TabLineSel.bg = "none";
      TabLineFill.bg = "none";

      BufferCurrent.bg = "none";
      BufferCurrent.fg = "NvimLightGray4";
      BufferCurrent.sp = "none";
      BufferCurrentMod.fg = "NvimLightYellow";
      BufferCurrentSign = BufferCurrent;

      BufferVisible.bg = "none";
      BufferVisible.fg = "NvimDarkGray4";
      BufferVisible.sp = "none";
      BufferVisibleMod = BufferVisible // { fg = "NvimDarkYellow"; };
      BufferVisiblePick = BufferVisible // { fg = "NvimLightRed"; };
      BufferVisibleSign = BufferVisible;

      BufferAlternate.bg = "#ffff00";
      BufferAlternate.fg = "#0000ff";
      BufferAlternate.sp = "none";
      BufferAlternateMod = BufferAlternate // { fg = "NvimDarkYellow"; };
      BufferAlternatePick = BufferAlternate // { fg = "NvimLightRed"; };
      BufferAlternateSign = BufferAlternate // { bg = "none"; fg = BufferAlternate.bg; };

      BufferInactive.bg = "NvimDarkGray1";
      BufferInactive.fg = "NvimDarkGray4";
      BufferInactive.sp = "none";
      BufferInactiveMod = BufferInactive // { fg = "NvimDarkYellow"; };
      BufferInactivePick = BufferAlternate // { fg = "NvimLightRed"; };
      BufferInactiveSign = BufferInactive // { bg = "none"; fg = BufferInactive.bg;
      };
    };

    extraConfigLuaPost = ''
      vim.opt.sessionoptions:append 'globals'
      vim.api.nvim_create_autocmd({ 'User' }, {
        pattern = 'PersistedSavePre',
        group = vim.api.nvim_create_augroup('PersistedHooks', {}),
        callback = function()
          vim.api.nvim_exec_autocmds('User', { pattern = 'SessionSavePre' })
        end,
      })
    '';

    keymaps = [
      # Reordering tabs
      { mode = [ "n" ]; key = "<m-s-j>"; action = "<cmd>BufferMoveNext<cr>";     }
      { mode = [ "n" ]; key = "<m-s-k>"; action = "<cmd>BufferMovePrevious<cr>"; }
      { mode = [ "n" ]; key = "<m-p>";   action = "<cmd>BufferPin<cr>";          }

      # Navigating tabs
      { mode = [ "n" ]; key = "<m-j>";   action = "<cmd>BufferNext<cr>";         }
      { mode = [ "n" ]; key = "<m-k>";   action = "<cmd>BufferPrevious<cr>";     }
      { mode = [ "n" ]; key = "<m-1>";   action = "<cmd>BufferGoto 1<cr>";       }
      { mode = [ "n" ]; key = "<m-2>";   action = "<cmd>BufferGoto 2<cr>";       }
      { mode = [ "n" ]; key = "<m-3>";   action = "<cmd>BufferGoto 3<cr>";       }
      { mode = [ "n" ]; key = "<m-4>";   action = "<cmd>BufferGoto 4<cr>";       }
      { mode = [ "n" ]; key = "<m-5>";   action = "<cmd>BufferGoto 5<cr>";       }
      { mode = [ "n" ]; key = "<m-6>";   action = "<cmd>BufferGoto 6<cr>";       }
      { mode = [ "n" ]; key = "<m-7>";   action = "<cmd>BufferGoto 7<cr>";       }
      { mode = [ "n" ]; key = "<m-8>";   action = "<cmd>BufferGoto 8<cr>";       }
      { mode = [ "n" ]; key = "<m-9>";   action = "<cmd>BufferGoto 9<cr>";       }
      { mode = [ "n" ]; key = "<m-0>";   action = "<cmd>BufferLast<cr>";         }

      # Close tab
      { mode = [ "n" ]; key = "<m-x>";   action = "<cmd>BufferClose<cr>";        }
    ];
  };
}
