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
    home = {
      homeDirectory = "/home/vi";
      stateVersion = "22.11";
      username = "vi";
    };
    programs.git = {
      userEmail = "vimproved@inventati.org";
      userName = "vimproved";
    };
  };
}
