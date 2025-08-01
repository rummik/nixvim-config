{
  config.plugins.obsidian = {
    enable = true;

    settings = {
      completion = {
        min_chars = 2;
        #nvim_cmp = true;
        blink = true;
      };

      # new_notes_location = "current_dir";
      workspaces = [
        {
          name = "Notes";
          path = "~/Notes";
        }
        {
          name = "Obsidian";
          path = "~/Notes/obsidian/Obsidian";
        }
        # {
        #   name = "work";
        #   path = "~/Notes/work";
        # }
        # {
        #   name = "startup";
        #   path = "~/obsidian/startup";
        # }
      ];

      picker = {
        name = "telescope.nvim";

        note_mappings = {
          insert_link = "<C-l>";
          new = "<C-x>";
        };

        tag_mappings = {
          insert_tag = "<C-l>";
          tag_note = "<C-x>";
        };
      };

      mappings = {
        "gf" = {
          action = "require('obsidian').util.gf_passthrough";
          opts = {
            buffer = true;
            expr = true;
            noremap = false;
          };
        };

        "<leader>ch" = {
          action = "require('obsidian').util.toggle_checkbox";
          opts = {
            buffer = true;
          };
        };

        "<leader>of" = {
          action = "require('obsidian').util.gf_passthrough";
          opts = {
            buffer = true;
            expr = true;
            noremap = false;
          };
        };

        "<leader>os" = {
          action = "'<cmd>ObsidianSearch<CR>'";
        };

        "<leader>on" = {
          action = "'<cmd>ObsidianNew<CR>'";
        };

        "<leader>oN" = {
          action = "'<cmd>ObsidianNewFromTemplate<CR>'";
        };

        "<leader>ol" = {
          action = "'<cmd>ObsidianLink<CR>'";
        };

        "<leader>op" = {
          action = "'<cmd>ObsidianPasteImage<CR>'";
        };

        "<leader>oe" = {
          action = "'<cmd>ObsidianLinkNew<CR>'";
        };

        "<leader>oE" = {
          action = "'<cmd>ObsidianLinks<CR>'";
        };

        "<leader>ox" = {
          action = "'<cmd>ObsidianExtractNote<CR>'";
        };

        "<leader>ot" = {
          action = "'<cmd>ObsidianTemplate<CR>'";
        };

        "<leader>oT" = {
          action = "'<cmd>ObsidianTags<CR>'";
        };

        "<leader>ow" = {
          action = "'<cmd>ObsidianWorkspace<CR>'";
        };

        "<leader>od" = {
          action = "'<cmd>ObsidianDailies<CR>'";
        };

        "<leader>oD" = {
          action = "'<cmd>ObsidianToday<CR>'";
        };

        "<leader>oy" = {
          action = "'<cmd>ObsidianYesterday<CR>'";
        };

        "<leader>oc" = {
          action = "'<cmd>ObsidianCheck<CR>'";
        };

        "<leader>oo" = {
          action = "'<cmd>ObsidianOpen<CR>'";
        };
      };
    };
  };
}
