{ config, pkgs, ... }:

{
  imports = [
    ../../../nixos
  ];
  hardware.acpilight.enable = true;
  networking = {
    wireless.iwd.enable = true;
    networkmanager = {
      enable = true;
      wifi.backend = "iwd";
    };
  };
  home-manager.users.vi.xresources = {
    properties = {
      "Xft*dpi" = 144;
    };
  };
}
