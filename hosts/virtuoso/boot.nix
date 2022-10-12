{ config, pkgs, ... }:

{
  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    loader = {
      systemd-boot.enable = true;
      efi.efiSysMountPoint = "/boot/efi";
      timeout = 0;
    };
  };
}
