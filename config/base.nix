{
  viAlias = true;
  vimAlias = true;

  editorconfig.enable = true;
  performance.byteCompileLua.enable = true;

  plugins = {
    # aw-watcher.enable = true;                 # activitywatch watcher integration -- disabled due to slow tab switching

    neoconf.enable = true; # Global and project-local settings management
    bullets.enable = true; # Automated bullet lists
    overseer.enable = true; # Task runner & job management

    lsp-lines.enable = true; # LSP inline diagnostics
    tiny-inline-diagnostic.enable = true; # LSP inline diagnostics

    # nvim-surround.enable = true;              # Modify surrounding delimiter pairs
    nvim-autopairs.enable = true; # Automatically insert symbol pairs

    whitespace.enable = true; # Highlight and remove whitespace

    todo-comments.enable = true; # Todo comment highlights and search

    direnv.enable = true; # Direnv integration

    # dropbar.enable = true;                    # Breadcrumbs
    sqlite-lua.enable = true; # SQLite viewer
    # telekasten.enable = true;                 # Markdown wiki plugin thing
    # toggleterm.enable = true;                 # Persist and toggle multiple terminals
    # twilight.enable = true;                   # Dim regions that aren't being edited
    visual-multi.enable = true; # Multiple cursors

    undotree.enable = true; # Undo history tree view
    csvview.enable = true; # CSV file editing

    web-devicons.enable = true; # Icons
    tiny-devicons-auto-colors.enable = false; # Colorize devicons to match theme

    /*
      autosave = {
        enable = true;
      };
    */

    # Nerd Font glyph previews & search
    nerdy = {
      enable = true;
      enableTelescope = true;
    };

    # Library of 40+ independent lua modules
    mini = {
      enable = true;

      modules = {
        align = {
          mappings = {
            start = "ga";
            start_with_preview = "gA";
          };
        };

        trailspace.only_in_normal_buffers = true;
      };
    };

    # Hides colorcolumn when not needed
    smartcolumn = {
      enable = true;

      settings = {
        colorcolumn = [
          "80"
          "100"
          "120"
        ];

        disabled_filetypes = [
          "NvimTree"
          "Trouble"
          "checkhealth"
          "help"
          "lspinfo"
          "markdown"
          "neo-tree"
          "noice"
          # "text"
        ];
      };
    };

    # Startup page
    dashboard = {
      enable = false;

      settings = {
        change_to_vcs_root = true;
        config = {
          shortcut = [
            {
              action = "Lazy update";
              desc = "󰊳 Update";
              group = "@property";
              key = "u";
            }
            {
              action.__raw = "function(path) vim.cmd('Telescope find_files') end";
              desc = "Files";
              group = "Label";
              icon = " ";
              icon_hl = "@variable";
              key = "f";
            }
            {
              action = "Telescope app";
              desc = " Apps";
              group = "DiagnosticHint";
              key = "a";
            }
            {
              action = "Telescope dotfiles";
              desc = " dotfiles";
              group = "Number";
              key = "d";
            }
          ];

          week_header.enable = true;
        };
      };
    };

    # smear-cursor = {
    #   enable = true;
    #
    #   settings = {
    #     # legacy_computing_symbols_support = true;
    #     # scroll_buffer_space = true;
    #     cursor_color = "#ff00ff";
    #     transparent_bg_fallback_color = "#000000";
    #     cterm_bg = 235;
    #     cterm_cursor_colors = [
    #       240
    #       241
    #       242
    #       243
    #       244
    #       245
    #       246
    #       247
    #       248
    #       249
    #       250
    #       251
    #       252
    #       253
    #       254
    #       255
    #     ];
    #   };
    # };
  };

  globals.mapleader = " ";

  # Always use clipboard
  clipboard.register = "unnamedplus";
  clipboard.providers.xclip.enable = true;
  # globals.clipboard = "tmux";

  opts = {
    # Mouse support
    mouse = "a";
    mousemoveevent = true;

    # Background
    background = "dark";

    # Enable filetype indentation
    #filetype plugin indent on

    termguicolors = true;

    # Line Numbers
    number = true;
    relativenumber = false;

    # Spellcheck
    spelllang = "en_us";

    # Some defaults
    tabstop = 2;
    shiftwidth = 2;
    expandtab = true;

    # backupdir = "~/.config/nvim/backup";
    # directory = "~/.config/nvim/swap";
    # undodir = "~/.config/nvim/undo";
  };

  keymaps = [
    # Disable middle-click paste (triggers when scrolling with trackpoint)
    {
      mode = [
        "n"
        "v"
        "o"
        "i"
      ];
      key = "<MiddleMouse>";
      action = "<nop>";
    }
  ];
}
