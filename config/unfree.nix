{ lib, pkgs, ... }:
{
  imports =
    [
    ];

  config.plugins =
    lib.mkIf
      pkgs.config.allowUnfree
      {
        # Show where the cursor is when jumping large distances
        specs = {
          enable = true;
          settings.min_jump = 20;
          settings.popup.winhl = "PmenuSel";
          settings.pop.fader.__raw = "require('specs').exp_fader";
          settings.pop.resizer.__raw = "require('specs').shrink_resizer";
        };

        # Spelling
        blink-cmp-spell.enable = true;
        blink-cmp.settings.sources.providers.spell = {
          module = "blink-cmp-spell";
          name = "Spell";
          score_offset = 100;
          opts = {};
        };
      };
}
