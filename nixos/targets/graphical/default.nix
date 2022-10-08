{ config, pkgs, ... }:

{
  imports = [
    ../../kitty
    ../../firefox
    ../../fish
    ../../fzf
    ../../neovim
  ];
  programs.dconf.enable = true;
}
