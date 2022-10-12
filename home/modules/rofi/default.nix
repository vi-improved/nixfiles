{ config, pkgs, ... }:

{
  programs.rofi = {
    enable = true;
    font = "Hack Nerd Font 11";
    terminal = "kitty";
  };
}
