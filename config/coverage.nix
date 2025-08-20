{ lib, helpers, ... }:
{
  imports = [
    {
      options.plugins.coverage.signs = lib.genAttrs [ "covered" "partial" "uncovered" ] (name: {
        priority = helpers.defaultNullOpts.mkInt 10 "The priority for displaying the ${name} signs.";
      });
    }
  ];

  config.plugins.coverage = {
    enable = true;
    autoReload = true;

    signs.covered = {
      text = "┃";
      priority = 130;
    };

    signs.partial = {
      text = "┃";
      priority = 120;
    };

    signs.uncovered = {
      text = "┃";
      priority = 120;
    };
  };
}
