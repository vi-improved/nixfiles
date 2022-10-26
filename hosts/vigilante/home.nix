{ config, pkgs, home-manager, ... }:

{
  hardware.openrazer.users = [ "vi" ];
  home-manager.users.vi = {
    imports = [
      ../../home
      ../../home/modules/bat
      ../../home/modules/btop
      ../../home/modules/dunst
      ../../home/modules/firefox
      ../../home/modules/fish
      ../../home/modules/fzf
      ../../home/modules/kitty
      ../../home/modules/mpv
      ../../home/modules/nnn
      ../../home/modules/rofi
      ../../home/modules/xmobar
      ../../home/modules/xmonad
      ../../home/modules/zathura
    ];
    programs.git = {
      userEmail = "vimproved@inventati.org";
      userName = "vimproved";
    };
    xresources.properties = {
      "Xft*dpi" = 168;
    };
  };
}
