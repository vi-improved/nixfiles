# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports = [
      ./hardware.nix
      ./boot.nix
      ./home.nix
      ../../nixos
      ../../nixos/modules/fish
      ../../nixos/modules/git
      ../../nixos/modules/neovim
      ../../nixos/modules/pipewire
      ../../nixos/modules/xorg
  ];
  environment.systemPackages = with pkgs; [
    krita
  ];
  hardware.firmware = [
    (pkgs.stdenvNoCC.mkDerivation {
      name = "brcm-firmware";
      buildCommand = ''
        dir="$out/lib/firmware"
        mkdir -p "$dir"
        cp -r ${../../nixos/files/firmware}/* "$dir"
      '';
    })
  ];
  users.users.vi = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    shell = pkgs.fish;
    packages = with pkgs; [
      osu-lazer
      openttd
      openrct2
    ];
  };
  networking = {
    hostName = "vigilante";
    wireless.iwd.enable = true;
    networkmanager.enable = true;
  };
  time.timeZone = "US/Michigan";
  system.stateVersion = "22.11";
  services.xserver.libinput.enable = true;
}

