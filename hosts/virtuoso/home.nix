{ config, pkgs, home-manager, ... }:

{
  hardware.openrazer.users = [ "vi" ];
  home-manager.users.vi = {
    imports = [
      ../../home
      ../../home/config
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
      ../../home/modules/zathura
    ];
    programs.git = {
      userEmail = "vimproved@inventati.org";
      userName = "vimproved";
    };
  };
}
