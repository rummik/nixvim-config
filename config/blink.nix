{
  lib,
  ...
}:

{
  config.plugins = {
    blink-cmp = {
      enable = true;

      settings = {
        appearance = {
          nerd_font_variant = "mono";
          # nerd_font_variant = "normal";
          # use_nvim_cmp_as_default = true;
        };

        enabled = lib.nixvim.mkRaw ''
          function()
            -- return not vim.tbl_contains({ "lua", "markdown" }, vim.bo.filetype)
            --   and vim.bo.buftype ~= "prompt"
            --   and vim.b.completion ~= false

            return vim.bo.buftype ~= 'prompt' and vim.b.completion ~= false
          end
        '';

        completion = {
          accept = {
            auto_brackets = {
              enabled = true;

              semantic_token_resolution = {
                enabled = false;
              };
            };
          };

          documentation = {
            auto_show = true;
          };
        };

        keymap = {
          preset = "super-tab";

          "<A-k>" = [ "select_prev" "fallback" ];
          "<A-j>" = [ "select_next" "fallback" ];
        };

        signature = {
          enabled = true;
        };

        sources = {
          cmdline = [];
          # cmdline.keymap = {
          #   preset = "cmdline";
          #   "<A-k>" = [ "select_prev" "fallback" ];
          #   "<A-j>" = [ "select_next" "fallback" ];
          # };
          # term = {};

          default = [
            "lsp"
            "path"
            "snippets"
            # "luasnip"
            "buffer"
            "emoji"
            "spell"
            # "omni"
          ];

          providers = {
            buffer = {
              score_offset = -7;
            };

            # lsp = {
            #   fallbacks = [ "buffer" ];
            # };
          };
        };
      };
    };

    # Spelling
    blink-cmp-spell.enable = true;
    blink-cmp.settings.sources.providers.spell = {
      module = "blink-cmp-spell";
      name = "Spell";
      score_offset = 100;
      opts = {};
    };

    # Emoji
    blink-emoji.enable = true;
    blink-cmp.settings.sources.providers.emoji = {
      module = "blink-emoji";
      name = "Emoji";
      score_offset = 15;

      opts = {
        insert = true;
      };

      should_show_items.__raw = ''
        function()
          return vim.tbl_contains(
            -- Enable emoji completion only for git commits and markdown.
            -- By default, enabled for all file-types.
            { "gitcommit", "markdown" },
            vim.o.filetype
          )
        end
      '';
    };
  };
}
