{ config, pkgs, ... }:

{
  fonts.fontconfig.defaultFonts.monospace = [ "Hack Nerd Font" ];
  fonts.fontconfig.defaultFonts.sansSerif = [ "Cantarell" ];
}
