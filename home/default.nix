{ config, pkgs, lib, ... }:

{
  home = {
    homeDirectory = "/home/vi";
    stateVersion = "22.11";
    username = "vi";
  };
  programs.home-manager.enable = true;
  xdg.enable = true;
}
