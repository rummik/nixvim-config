{
  config.plugins.indent-blankline = {
    enable = true;
    settings = rec {
      indent = {
        char = "┊";
        # tab_char = "→";
        # tab_char = "·";
        smart_indent_cap = true;

        highlight = [
          "IndentBlanklineIndent1"
          "IndentBlanklineIndent2"
          "IndentBlanklineIndent3"
          "IndentBlanklineIndent4"
          "IndentBlanklineIndent5"
          "IndentBlanklineIndent6"
        ];
      };

      whitespace = {
        remove_blankline_trail = false;
        highlight = indent.highlight;
      };

      scope = {
        char = "│";
        # show_exact_scope = true;
        highlight = indent.highlight;
        # highlight = [
        #   "RainbowDelimiterCyan"
        #   "RainbowDelimiterViolet"
        #   "RainbowDelimiterGreen"
        #   "RainbowDelimiterOrange"
        #   "RainbowDelimiterBlue"
        #   "RainbowDelimiterYellow"
        #   "RainbowDelimiterRed"
        # ];
      };

      exclude = {
        buftypes = [
          "terminal"
          "quickfix"
        ];

        filetypes = [
          ""
          "dashboard"
          "checkhealth"
          "help"
          "lspinfo"
          "packer"
          "TelescopePrompt"
          "TelescopeResults"
          "yaml"
        ];
      };
    };
  };

  config.opts.list = true;
  config.opts.listchars = "tab:|->,lead:·,space: ,trail:•,extends:→,precedes:←,nbsp:␣";
  # config.opts.listchars = "tab:|->,lead:·,space: ,trail:•,extends:→,precedes:←,nbsp:␣,eol:↴";

  config.highlight = {
    IndentBlanklineContextChar.fg = "#787572";
    IndentBlanklineIndent1.fg = "#372C25";
    IndentBlanklineIndent2.fg = "#35302B";
    IndentBlanklineIndent3.fg = "#283329";
    IndentBlanklineIndent4.fg = "#163632";
    IndentBlanklineIndent5.fg = "#112F3F";
    IndentBlanklineIndent6.fg = "#36283D";
  };
}
