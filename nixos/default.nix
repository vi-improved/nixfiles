# This module contains configuration to be shared across all NixOS machines
{ config, pkgs, ... }:

{
  imports = [
    ./themes/fonts
    ./git
  ];
  security = {
    doas = {
      enable = true;
      extraRules = [ { groups = [ "wheel" ]; persist = true; setEnv = [ "NIX_PATH" ]; } ];
    };
    sudo.enable = false;
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
