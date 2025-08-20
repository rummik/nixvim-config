{
  imports = [
    ./colorscheme.nix               # Configure personal colors
    # ./barbar.nix                    # Tabbed buffers
    ./blink.nix                     # Completions
    ./bufferline.nix                # Tabbed buffers
    ./ccc.nix                       # Color code slider with color highlights
    # ./colorizer.nix                 # Color background highlights
    ./comment.nix                   # Toggle comments
    ./coverage.nix                  # Code coverage
    ./dap.nix                       # Debug Adapter Protocol client
    ./gitsigns.nix                  # Git status in the gutters
    ./indent-blankline.nix          # Indentation guides
    ./lspsaga.nix                   # LSP interface
    ./neotest.nix                   # Framework for interacting with tests
    ./neogit.nix                    # Interactive Git interface
    ./noice.nix                     # Highly experimental plugin that completely
                                    # replaces the UI for messages, cmdline and
                                    # the popupmenu.
    ./notify.nix                    # Puts notifications in a little UI bubble
    ./persisted.nix                 # Session management
    ./rainbow-delimiters.nix        # Colorize delimiters
    # ./tabby.nix                     # Tabbed buffers
    ./telescope.nix                 # Fuzzy finder, file browser, etc.
    ./transparent.nix               # Make the editor transparent
    ./treesitter.nix                # Use treesitter for handling syntax
    ./trouble.nix                   # LSP diagnostics
  ];

  config = {
    viAlias = true;
    vimAlias = true;

    editorconfig.enable = true;

    plugins = {
      # nix.enable = true;

      direnv = {
        enable = true;
        autoLoad = true;
      };

      # dropbar.enable = true;          # Breadcrumbs
      # lsp-lines.enable = true;        # LSP inline diagnostics
      sqlite-lua.enable = true;       # SQLite viewer
      # telekasten.enable = true;       # Markdown wiki plugin thing
      # toggleterm.enable = true;       # Persist and toggle multiple terminals
      twilight.enable = true;         # Dim regions that aren't being edited
      visual-multi.enable = true;     # Multiple cursors
      web-devicons.enable = true;     # Icons

      /*
        autosave = {
          enable = true;
        };
      */

      undotree.enable = true;

      csvview = {
        enable = true;
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

      # Show where the cursor is when jumping large distances
      specs = {
        enable = true;
        settings.min_jump = 20;
        settings.popup.winhl = "PmenuSel";
        settings.pop.fader.__raw = "require('specs').exp_fader";
        settings.pop.resizer.__raw = "require('specs').shrink_resizer";
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

      # Fancy statusline
      lualine = {
        enable = true;

        settings.sections = {
          lualine_c = [
            {
              __unkeyed-1 = "filename";
              path = 1;
              newfile_status = true;
            }
          ];

          lualine_x = [
            "encoding"
            "fileformat"
            "filetype"
          ];
        };
      };
    };

    globals.mapleader = " ";

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
      relativenumber = true;

      # Spellcheck
      spelllang = "en_us";

      # Use X clipboard
      clipboard = "unnamedplus";

      # Some defaults
      tabstop = 2;
      shiftwidth = 2;
      expandtab = true;

      # backupdir = "~/.config/nvim/backup";
      # directory = "~/.config/nvim/swap";
      # undodir = "~/.config/nvim/undo";

      # Needed for obsidian
      conceallevel = 2;
    };

    keymaps = [
      # Disable middle-click paste (triggers when scrolling with trackpoint)
      { mode = [ "n" "v" "o" "i" ]; key = "<MiddleMouse>"; action = "<nop>"; }
    ];
  };
}
