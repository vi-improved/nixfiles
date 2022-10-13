{ config, pkgs, ... }:

{
  home.file = {
    xinitrc = {
      text = builtins.readFile ../../files/xorg/xinitrc + "exec xmonad";
      target = ".xinitrc";
    };
    xmonad = {
      source = ../../files/xmonad/xmonad.hs;
      target = ".config/xmonad/xmonad.hs";
    };
  };
  xsession.windowManager.xmonad = {
    enable = true;
    enableContribAndExtras = true;
    config = ../../files/xmonad/xmonad.hs;
  };
}
