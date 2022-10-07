{ config, pkgs, ... }:

{
  imports = [
    ../../desktop
    ../utils
  ];
  services = {
    xserver = {
      displayManager.startx.enable = true; enable = true;
      windowManager.xmonad = {
        config = ./xmonad.hs;
        enable = true;
	enableConfiguredRecompile = true;
        enableContribAndExtras = true;
      };
    };
  };
  home-manager.users.vi.home.file = {
    xinitrc = { text = builtins.readFile ../xinitrc + "exec xmonad"; target = ".xinitrc"; };
    xmonad = { source = ./xmonad.hs; target = ".config/xmonad/xmonad.hs"; };
  };
  home-manager.users.vi.programs.xmobar = {
    enable = true;
    extraConfig = builtins.readFile ./xmobarrc;
  };
}
