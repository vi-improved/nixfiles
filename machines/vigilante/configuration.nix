{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../nixos/users/vi.nix
    ../../nixos/laptop
    ../../nixos/desktop/xmonad
  ];
  networking.hostName = "vigilante";
  time.timeZone = "US/Michigan";
  hardware.firmware = [
    (pkgs.stdenvNoCC.mkDerivation {
      name = "brcm-firmware";
      buildCommand = ''
        dir="$out/lib/firmware"
        mkdir -p "$dir"
        cp -r ${./wifi-firmware}/* "$dir"
      '';
    })
  ];
  services.xserver.libinput = {
    enable = true;
    touchpad.tapping = false;
    touchpad.accelSpeed = "0.15";
  };
}
