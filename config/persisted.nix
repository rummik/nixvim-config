{
  config.plugins.persisted = {
    enable = true;
    enableTelescope = true;

    # settings.autostart = false;
    settings.autoload = true;
  };

  config.keymaps = [
    { mode = [ "n" ]; key = "<leader>sf"; action = "<cmd>Telescope persisted<cr>"; }
    { mode = [ "n" ]; key = "<leader>st"; action = "<cmd>SessionToggle<cr>";       }
    { mode = [ "n" ]; key = "<leader>sl"; action = "<cmd>SessionLoad<cr>";         }
    { mode = [ "n" ]; key = "<leader>ss"; action = "<cmd>SessionStart<cr>";        }
    { mode = [ "n" ]; key = "<leader>sx"; action = "<cmd>SessionStop<cr>";         }
    { mode = [ "n" ]; key = "<leader>sd"; action = "<cmd>SessionDelete<cr>";       }
  ];
}
