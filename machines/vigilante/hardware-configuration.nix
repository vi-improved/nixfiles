# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "nvme" "usbhid" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];
  boot.extraModprobeConfig = ''
      options hid_apple swap_opt_cmd=1
      options hid_apple swap_fn_leftctrl=1
    '';
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
  };
  fileSystems."/" =
    { device = "/dev/disk/by-uuid/3a5d8e4e-bbc8-4ba0-b014-8b68ef233f42";
      fsType = "btrfs";
      options = [ "subvol=@nixos" ];
    };

  fileSystems."/nix" =
    { device = "/dev/disk/by-uuid/3a5d8e4e-bbc8-4ba0-b014-8b68ef233f42";
      fsType = "btrfs";
      options = [ "subvol=@nixos-nix" ];
    };

  fileSystems."/var/log" =
    { device = "/dev/disk/by-uuid/3a5d8e4e-bbc8-4ba0-b014-8b68ef233f42";
      fsType = "btrfs";
      options = [ "subvol=@nixos-log" ];
    };

  fileSystems."/.snapshots" =
    { device = "/dev/disk/by-uuid/3a5d8e4e-bbc8-4ba0-b014-8b68ef233f42";
      fsType = "btrfs";
      options = [ "subvol=@nixos-.snapshots" ];
    };

  fileSystems."/home" =
    { device = "/dev/disk/by-uuid/3a5d8e4e-bbc8-4ba0-b014-8b68ef233f42";
      fsType = "btrfs";
      options = [ "subvol=@nixos-home" ];
    };

  fileSystems."/boot/efi" =
    { device = "/dev/disk/by-uuid/5F66-17ED";
      fsType = "vfat";
    };

  swapDevices =
    [ { device = "/dev/disk/by-uuid/cca5d20b-435b-4ae1-bac7-0dffb4cf4939"; }
    ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp230s0f1u1.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlan0.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
  # high-resolution display
  hardware.video.hidpi.enable = lib.mkDefault true;
}