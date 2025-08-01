{
  config.plugins.ccc = {
    enable = true;

    settings = {
      highlighter.auto_enable = true;

      inputs = [
        "ccc.input.rgb"
        "ccc.input.hsl"
        "ccc.input.hwb"
        "ccc.input.lab"
        "ccc.input.lch"
        "ccc.input.oklab"
        "ccc.input.oklch"
        "ccc.input.cmyk"
        "ccc.input.hsluv"
        "ccc.input.okhsl"
        "ccc.input.hsv"
        "ccc.input.okhsv"
        "ccc.input.xyz"
      ];

      mappings = {
        "<esc>".__raw = "require('ccc').mapping.quit";
      };
    };
  };

  config.keymaps = [
    { mode = [ "n" ]; key = "<leader>cp"; action = "<cmd>CccPick<cr>"; }
  ];
}
