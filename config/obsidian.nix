{ lib, helpers, ... }:

{
  config.plugins.obsidian = {
    enable = true;

    settings = {
      legacy_commands = false;

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
    };
  };

  config.keymaps = [
    { key = "<leader>od"; action = "<cmd>Obsidian dailies<CR>"; }
    { key = "<leader>on"; action = "<cmd>Obsidian new<CR>"; }
    { key = "<leader>oN"; action = "<cmd>Obsidian new_from_template<CR>"; }
    { key = "<leader>oo"; action = "<cmd>Obsidian open<CR>"; }
    { key = "<leader>os"; action = "<cmd>Obsidian search<CR>"; }
    { key = "<leader>oT"; action = "<cmd>Obsidian tags<CR>"; }
    { key = "<leader>oD"; action = "<cmd>Obsidian today<CR>"; }
    { key = "<leader>oM"; action = "<cmd>Obsidian tomorrow<CR>"; }
    { key = "<leader>ow"; action = "<cmd>Obsidian workspace<CR>"; }
    { key = "<leader>oy"; action = "<cmd>Obsidian yesterday<CR>"; }
  ];

  imports = [
    (
      let
        mkKeymapEvent = { event, pattern, mappings }:
          let group = "nixvim_binds_${event}"; in {
          config.autoGroups.${group}.clear = true;
          config.autoCmd = [{
            inherit event pattern group;
            desc = "Load keymaps for ${event}";

            callback = helpers.mkRaw ''
              function(ev)
                do
                  local __nixvim_binds = ${helpers.toLuaObject (map helpers.keymaps.removeDeprecatedMapAttrs mappings)}
                  for i, map in ipairs(__nixvim_binds) do
                    vim.keymap.set(map.mode, map.key, map.action, map.options)
                  end
                end
              end
            '';
          }];
        };
      in
        mkKeymapEvent {
          event = "User";
          pattern = "ObsidianNoteEnter";

          mappings = [
            # Smart action depending on context, either follow link or toggle checkbox.
            {
              key = "<cr>";
              action.__raw = ''function()
                return require("obsidian").util.smart_action()
              end'';
              options = { buffer.__raw = "ev.buf"; expr = true; };
            }

            { key = "<C-p>"; action = "<cmd>Obsidian search<CR>"; options.buffer.__raw = "ev.buf"; }

            { key = "<leader>ob"; action = "<cmd>Obsidian backlinks<CR>"; options.buffer.__raw = "ev.buf"; }
            { key = "<leader>ox"; action = "<cmd>Obsidian extract_note<CR>"; options.buffer.__raw = "ev.buf"; }
            { key = "<leader>of"; action = "<cmd>Obsidian follow_link<CR>"; options.buffer.__raw = "ev.buf"; }
            { key = "<leader>ol"; action = "<cmd>Obsidian link<CR>"; options.buffer.__raw = "ev.buf"; }
            { key = "<leader>oe"; action = "<cmd>Obsidian link_new<CR>"; options.buffer.__raw = "ev.buf"; }
            { key = "<leader>oE"; action = "<cmd>Obsidian links<CR>"; options.buffer.__raw = "ev.buf"; }
            { key = "<leader>op"; action = "<cmd>Obsidian paste_image<CR>"; options.buffer.__raw = "ev.buf"; }
            { key = "<leader>oq"; action = "<cmd>Obsidian quick_switch<CR>"; options.buffer.__raw = "ev.buf"; }
            { key = "<leader>or"; action = "<cmd>Obsidian rename<CR>"; options.buffer.__raw = "ev.buf"; }
            { key = "<leader>ot"; action = "<cmd>Obsidian template<CR>"; options.buffer.__raw = "ev.buf"; }
            { key = "<leader>oL"; action = "<cmd>Obsidian toc<CR>"; options.buffer.__raw = "ev.buf"; }
            { key = "<leader>ch"; action = "<cmd>Obsidian toggle_checkbox<CR>"; options.buffer.__raw = "ev.buf"; }
          ];
        }
    )
  ];
}
