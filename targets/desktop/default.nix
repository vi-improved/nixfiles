{ config, pkgs, ... }:

{
  imports = [
    ../../programs/kitty
    ../../programs/firefox
    ../../programs/fish
    ../../programs/fzf
    ../../programs/neovim
    ../../programs/redshift
  ];
  environment.systemPackages = with pkgs; [
    redshift
  ];
  programs.dconf.enable = true;
}
