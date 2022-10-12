{ config, pkgs, ... }:

{
  home.file = {
    xmonad = { source = ./xmonad/xmonad.hs; target = ".config/xmonad/xmonad.hs"; };
    xmobar = { source = ./xmobar/xmobarrc; target = ".config/xmobar/xmobarrc"; };
  };
}
