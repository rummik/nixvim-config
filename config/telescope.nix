{
  config.plugins.telescope = {
    enable = true;

    extensions.frecency.enable = true;
    extensions.fzf-native.enable = true;
    # extensions.manix.enable = true;
    # extensions.media_files.enable = true;
    extensions.ui-select.enable = true;
    # extensions.undo.enable = true;

    settings.defaults = {
      layout_config.prompt_position = "top";
      sorting_strategy = "ascending";

      mappings = {
        i = {
          "<m-j>".__raw = "require('telescope.actions').move_selection_next";
          "<m-k>".__raw = "require('telescope.actions').move_selection_previous";
          "<c-h>".__raw = "require('telescope.actions').preview_scrolling_left";
          "<c-j>".__raw = "require('telescope.actions').preview_scrolling_down";
          "<c-k>".__raw = "require('telescope.actions').preview_scrolling_up";
          "<c-l>".__raw = "require('telescope.actions').preview_scrolling_right";
        };
      };
    };

    keymaps = {
      "<leader>ft" = "";
      "<leader>ff" = "find_files";
      "<leader>fg" = "live_grep";
      "<leader>fb" = "buffers";
      "<leader>fh" = "help_tags";
      "<leader>sf" = "persisted";
      "<leader>fs" = "persisted";
    };
  };

  config.keymaps = [
    { mode = [ "n" ]; key = "<c-p>";   action = "<cmd>Telescope find_files<cr>"; }
    { mode = [ "n" ]; key = "<c-s-p>"; action = "<cmd>Telescope commands<cr>";   }
    { mode = [ "n" ]; key = "<c-k>";   action = "<cmd>Telescope buffers<cr>";    }
    { mode = [ "n" ]; key = "<c-s-k>"; action = "<cmd>Telescope keymaps<cr>";    }
  ];
}
