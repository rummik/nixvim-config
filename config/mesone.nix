{ lib, ... }:
{
  options.plugins = {
    mesone.enable = lib.mkEnableOption "mesone";
    # mesone.meson-package = lib.mkOption {
    #   type = lib.types.package;
    #   default = pkgs.meson;
    #   description = ''
    #     The meson package to use.
    #   '';
    # };
  };

  # config = {
  #   # The mesone plugin requires fidget
  #   plugins = lib.optionalAttrs (mesone.enable or false) {
  #     fidget.enable = true;
  #   };
  #
  #   extraPackages = lib.optional (mesone.enable or false) mesone.meson-package;
  # };
}
