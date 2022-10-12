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
      ../../nixos/modules/corectrl
      ../../nixos/modules/fish
      ../../nixos/modules/gamemode
      ../../nixos/modules/git
      ../../nixos/modules/neovim
      ../../nixos/modules/openrazer
      ../../nixos/modules/pipewire
      ../../nixos/modules/steam
      ../../nixos/modules/xmonad
  ];
  users.users.vi = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };
  networking.hostName = "virtuoso";
  time.timeZone = "US/Michigan";
  system.stateVersion = "22.11";
}

