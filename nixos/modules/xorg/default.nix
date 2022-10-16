{ config, pkgs, ... }:

{
  services.xserver = {
    enable = true;
    displayManager.startx.enable = true;
  };
  hardware.opengl = {
    enable = true;
    driSupport = true;
  };
}
