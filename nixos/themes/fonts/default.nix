{ config, pkgs, ... }:

{
  imports = [
    ../../../common/themes/fonts
  ];
  fonts.fontconfig.defaultFonts.monospace = [ "Hack Nerd Font" ];
  fonts.fontconfig.defaultFonts.sansSerif = [ "Cantarell" ];
}
