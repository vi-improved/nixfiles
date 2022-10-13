{ config, pkgs, ... }:

{
  programs.xmobar = {
    enable = true;
    extraConfig = builtins.readFile ../../files/xmobar/xmobarrc;
  };
}
