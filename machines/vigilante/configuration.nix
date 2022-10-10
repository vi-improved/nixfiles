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
      efi.efiSysMountPoint = "/boot/efi";
      systemd-boot.enable = true;
    };
    extraModprobeConfig = ''
      options hid_apple swap_fn_leftctrl=1
      options hid_apple swap_opt_cmd=1
    '';
  };
  networking.hostName = "vigilante";
  time.timeZone = "US/Michigan";
  hardware.firmware = [
    (pkgs.stdenvNoCC.mkDerivation {
      name = "brcm-firmware";
      buildCommand = ''
        dir="$out/lib/firmware"
        mkdir -p "$dir"
        cp -r ${./firmware}/* "$dir"
      '';
    })
  ];
  services.xserver.libinput = {
    enable = true;
    touchpad.tapping = false;
    touchpad.accelSpeed = "0.15";
  };
}
