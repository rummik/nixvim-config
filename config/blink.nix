{
  lib,
  ...
}:

{
  config.plugins = {
    colorful-menu.enable = true;
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

          menu.draw = {
            columns = [ [ "kind_icon" ] { __unkeyed_1 = "label"; gap = 1; } ];
            components.label = {
              text = lib.nixvim.mkRaw ''
                function(ctx)
                  return require("colorful-menu").blink_components_text(ctx)
                end
              '';
              highlight = lib.nixvim.mkRaw ''
                function(ctx)
                  return require("colorful-menu").blink_components_highlight(ctx)
                end
              '';
            };
          };
        };

        keymap = {
          preset = "super-tab";

          "<m-k>" = [ "select_prev" "fallback" ];
          "<m-j>" = [ "select_next" "fallback" ];
        };

        signature = {
          enabled = true;
        };

        sources = {
          cmdline = [];
          # cmdline.keymap = {
          #   preset = "cmdline";
          #   "<m-k>" = [ "select_prev" "fallback" ];
          #   "<m-j>" = [ "select_next" "fallback" ];
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
