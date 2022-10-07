{ config, pkgs, ... }:

{
  imports = [
    ../../../programs/dunst
    ../../../programs/mpv
    ../../../programs/nnn
    ../../../programs/rofi
    ../../../programs/zathura
  ];
}
