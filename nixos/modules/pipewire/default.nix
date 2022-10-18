{ config, pkgs, ... }:

{
  sound.enable = true;
  environment.systemPackages = with pkgs; [
    pavucontrol
  ];
  security.rtkit.enable = true;
  services = {
    dbus.enable = true;
    pipewire = {
      enable = true;
      alsa.enable = true;
      jack.enable = true;
      pulse.enable = true;
      socketActivation = true;
    };
  };
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
    ];
  };
}
