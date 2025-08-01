{
  config.plugins.colorizer = {
    enable = false;

    settings.filetypes = rec {
      __unkeyed-1 = "*";
      css.css = true;
      scss = css;
      sass = css;
      less = css;
      stylus = css;
    };

    settings.buftypes = [
      "*"
      "!prompt"
      "!popup"
    ];

    settings.user_default_options = {
      RGB = false;
      names = false;
      RRGGBBAA = true;
      AARRGGBB = true;
    };
  };
}
