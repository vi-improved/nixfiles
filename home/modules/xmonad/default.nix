{ config, pkgs, ... }:

{
  home.file = {
    xinitrc = {
      text = builtins.readFile ../../files/xorg/xinitrc + "feh --bg-fill ~/Pictures/Wallpapers/spookcat.png\nexec xmonad";
      target = ".xinitrc";
    };
    xmonad = {
      source = ../../files/xmonad/xmonad.hs;
      target = ".config/xmonad/xmonad.hs";
    };
    wallpaper = {
      source = ../../files/xmonad/spookcat.png;
      target = "Pictures/Wallpapers/spookcat.png";
    };
  };
  programs.feh.enable = true;
  xsession.windowManager.xmonad = {
    enable = true;
    enableContribAndExtras = true;
  };
}
