{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../nixos/users/vi.nix
    ../../nixos/targets/laptop
    ../../nixos/targets/graphical/xmonad
  ];
  boot = {
    loader = {
      grub = {
        enable = true;
        device = "nodev";
        version = 2;
        efiSupport = true;
        enableCryptodisk = true;
      };
    };
    initrd = {
      availableKernelModules = [
        "aesni_intel"
        "cryptd"
      ];
      luks.devices = {
        crypt = {
          device = "/dev/disk/by-uuid/95fdb7d9-4ddf-4740-96e1-dc538ca4f330";
          preLVM = true;
        };
      };
    };
  };
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
