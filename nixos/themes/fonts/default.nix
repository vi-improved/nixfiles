{ config, pkgs, ... }:

{
  import = [
    ../../../common/fonts
  ];
  fonts.fontconfig.defaultFonts.monospace = [ "Hack Nerd Font" ];
  fonts.fontconfig.defaultFonts.sansSerif = [ "Cantarell" ];
}
