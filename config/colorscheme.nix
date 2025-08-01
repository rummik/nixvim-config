{
  # Red     LightRed     DarkRed
  # Green   LightGreen   DarkGreen SeaGreen
  # Blue    LightBlue    DarkBlue  SlateBlue
  # Cyan    LightCyan    DarkCyan
  # Magenta LightMagenta DarkMagenta
  # Yellow  LightYellow  Brown     DarkYellow
  # Gray    LightGray    DarkGray
  # Black   White
  # Orange  Purple       Violet

  # Colors which define Nvim's default color scheme:
  #   NvimDarkBlue    NvimLightBlue
  #   NvimDarkCyan    NvimLightCyan
  #   NvimDarkGray1   NvimLightGray1
  #   NvimDarkGray2   NvimLightGray2
  #   NvimDarkGray3   NvimLightGray3
  #   NvimDarkGray4   NvimLightGray4
  #   NvimDarkGreen   NvimLightGreen
  #   NvimDarkMagenta NvimLightMagenta
  #   NvimDarkRed     NvimLightRed
  #   NvimDarkYellow  NvimLightYellow
  config = rec {
    opts.signcolumn = "auto:2-3";
    # opts.colorcolumn = "80,100,120";

    highlight = with colorschemes.base16.colorscheme; rec {
      ColorColumn.bg = base10;

      FoldColumn.bg = base00;
      Folded.bg = base00;

      Pmenu.bg = base00;
      PmenuSel.bg = base17;
      PmenuSel.fg = base00;
      PmenuSbar.bg = base00;

      PMenu = Pmenu;
      PMenuSel = PmenuSel;

      Visual.bg = base02; # selection
      NonText.fg = base04;
      Normal.bg = base11;
      SignColumn.bg = base11;
      BufferLineDevIconDefault.fg = base02;

      RainbowDelimiterRed.fg = base12;
      RainbowDelimiterYellow.fg = base13;
      RainbowDelimiterBlue.fg = base16;
      RainbowDelimiterOrange.fg = base09;
      RainbowDelimiterGreen.fg = base14;
      RainbowDelimiterViolet.fg = base17;
      RainbowDelimiterCyan.fg = base16;

    };

    plugins = with colorschemes.base16.colorscheme; {
      lualine.settings.options.theme =
        let
          colors = {
            fore = base05;
            back1 = base03;
            back2 = base10;
            replace = base13;
            insert = base14;
            visual = base15;
            command = base16;
            normal = base17;
          };
        in
        {
          normal = {
            a = {
              bg = colors.normal;
              fg = colors.back1;
              gui = "bold";
            };
            b = {
              bg = colors.back1;
              fg = colors.normal;
            };
            c = {
              bg = colors.back2;
              fg = colors.fore;
            };
          };
          insert = {
            a = {
              bg = colors.insert;
              fg = colors.back1;
              gui = "bold";
            };
            b = {
              bg = colors.back1;
              fg = colors.insert;
            };
            c = {
              bg = colors.back2;
              fg = colors.fore;
            };
          };
          replace = {
            a = {
              bg = colors.replace;
              fg = colors.back1;
              gui = "bold";
            };
            b = {
              bg = colors.back1;
              fg = colors.replace;
            };
            c = {
              bg = colors.back2;
              fg = colors.fore;
            };
          };
          visual = {
            a = {
              bg = colors.visual;
              fg = colors.back1;
              gui = "bold";
            };
            b = {
              bg = colors.back1;
              fg = colors.visual;
            };
            c = {
              bg = colors.back2;
              fg = colors.fore;
            };
          };
          command = {
            a = {
              bg = colors.command;
              fg = colors.back1;
              gui = "bold";
            };
            b = {
              bg = colors.back1;
              fg = colors.command;
            };
            c = {
              bg = colors.back2;
              fg = colors.fore;
            };
          };
        };

      bufferline.settings.highlights =
        let
          colors = {
            fore1 = base02;
            fore2 = base02;
            fore3 = base05;
            back1 = base17;
            back2 = base04;
            back3 = base03;
            back4 = base10;
            modified = base0B;
          };
        in
        rec {
          fill = {
            fg = "";
            bg = colors.back4;
          };
          background = {
            fg = colors.fore3;
            bg = colors.back3;
          };
          tab = {
            fg = colors.fore3;
            bg = colors.back3;
          };
          tab_selected = {
            fg = colors.fore2;
            bg = colors.back2;
          };
          tab_separator = {
            fg = colors.back4;
            bg = colors.back3;
          };
          tab_separator_selected = {
            fg = colors.back4;
            bg = colors.back2;
          };
          close_button = {
            fg = colors.fore3;
            bg = colors.back3;
          };
          close_button_visible = {
            fg = colors.fore2;
            bg = colors.back2;
          };
          close_button_selected = {
            fg = colors.fore1;
            bg = colors.back1;
          };
          buffer = {
            fg = colors.fore3;
            bg = colors.back3;
          };
          buffer_visible = {
            fg = colors.fore2;
            bg = colors.back2;
          };
          buffer_selected = {
            fg = colors.fore1;
            bg = colors.back1;
            bold = false;
            italic = false;
          };
          numbers = buffer;
          numbers_visible = buffer_visible;
          numbers_selected = buffer_selected;
          diagnostic = buffer;
          diagnostic_visible = buffer_visible;
          diagnostic_selected = buffer_selected;
          hint = buffer;
          hint_visible = buffer_visible;
          hint_selected = buffer_selected;
          hint_diagnostic = buffer;
          hint_diagnostic_visible = buffer_visible;
          hint_diagnostic_selected = buffer_selected;
          info = buffer;
          info_visible = buffer_visible;
          info_selected = buffer_selected;
          info_diagnostic = buffer;
          info_diagnostic_visible = buffer_visible;
          info_diagnostic_selected = buffer_selected;
          warning = buffer;
          warning_visible = buffer_visible;
          warning_selected = buffer_selected;
          warning_diagnostic = buffer;
          warning_diagnostic_visible = buffer_visible;
          warning_diagnostic_selected = buffer_selected;
          error = buffer;
          error_visible = buffer_visible;
          error_selected = buffer_selected;
          error_diagnostic = buffer;
          error_diagnostic_visible = buffer_visible;
          error_diagnostic_selected = buffer_selected;
          modified = {
            fg = colors.modified;
            bg = colors.back3;
          };
          modified_visible = {
            fg = colors.modified;
            bg = colors.back2;
          };
          modified_selected = {
            fg = colors.modified;
            bg = colors.back1;
          };
          duplicate = buffer;
          duplicate_visible = buffer_visible;
          duplicate_selected = buffer_selected;
          separator = {
            fg = colors.back4;
            bg = colors.back3;
          };
          separator_visible = {
            fg = colors.back4;
            bg = colors.back2;
          };
          separator_selected = {
            fg = colors.back4;
            bg = colors.back1;
          };
          indicator_visible = buffer_visible;
          indicator_selected = buffer_selected;
          pick = buffer;
          pick_visible = buffer_visible;
          pick_selected = buffer_selected;
          offset_separator = {
            fg = "#ff0000";
            bg = "#00ffff";
          };
          trunc_marker = {
            fg = colors.fore1;
            bg = colors.back4;
          };
        };

    };

    colorschemes.base16 = {
      enable = false;

      # Base 24 colorscheme
      colorscheme = {
        base11 = "#000000"; # Darkest Black
        base10 = "#111217"; # Darker Black
        base00 = "#21222a"; # Background
        base01 = "#24252e"; # Black
        base02 = "#262730"; # Bright Black
        base03 = "#2f313c"; # Gray
        base04 = "#464858"; # Light Gray
        base05 = "#666a84"; # Foreground
        base06 = "#bdbecb"; # White
        base07 = "#ffffff"; # Bright White

        base08 = "#de5324"; # Red
        base09 = "#ff9f00"; # Orange
        base0A = "#dac90b"; # Yellow
        base0B = "#72ba22"; # Green
        base0C = "#28b1aa"; # Cyan
        base0D = "#6c7de0"; # Blue
        base0E = "#c270b9"; # Magenta / Purple

        base0F = "#d24240"; # Dark Red / Brown

        base12 = "#ff6639"; # Bright Red
        base13 = "#fee900"; # Bright Yellow
        base14 = "#88e027"; # Bright Green
        base15 = "#46d5ce"; # Bright Cyan
        base16 = "#adbaff"; # Bright Blue
        base17 = "#ff74ef"; # Bright Magenta / Purple
      };
    };
  };
}
