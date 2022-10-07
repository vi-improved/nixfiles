# This module contains configuration to be shared across all NixOS machines
{ config, pkgs, ... }:

{
  imports = [
    ../../common
    ../../themes/fonts
    ../../themes/fonts/fontconfig.nix
  ];
  security = {
    doas = {
      enable = true;
      extraRules = [ { groups = [ "wheel" ]; persist = true; setEnv = [ "NIX_PATH" ]; } ];
    };
    sudo.enable = false;
  };
  boot = {
    loader = {
      efi = {
        efiSysMountPoint = "/boot/efi";
      };
      systemd-boot = {
        enable = true;
        consoleMode = "auto";
      };
      timeout = 0;
    };
  };
  documentation.man = {
    man-db.enable = false;
    mandoc.enable = true;
  };
  environment = {
    localBinInPath = true;
  };
  system.stateVersion = "22.11"; 
}
