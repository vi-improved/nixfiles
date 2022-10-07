{ config, pkgs, ... }:

{
  environment.systemPackages = [ pkgs.virtualenv ];
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
  };
}
