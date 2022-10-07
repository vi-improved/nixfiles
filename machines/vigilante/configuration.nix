{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./users/vi.nix
    ../../targets/nixos/laptop
    ../../targets/desktop/xmonad
  ];
  networking.hostName = "vigilante";
  time.timeZone = "US/Michigan";
}
