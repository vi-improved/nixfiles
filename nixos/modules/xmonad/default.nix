{ config, pkgs, ... }:

{
  services.xserver = {
    displayManager.startx.enable = true;
    enable = true;
    windowManager.xmonad = {
      enable = true;
      enableContribAndExtras = true;
    };
  };
}
