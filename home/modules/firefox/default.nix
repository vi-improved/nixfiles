{ config, pkgs, ... }:

{
  programs.firefox = {
    enable = true;
    profiles = {
      vi = {
        name = "vi";
      };
    };
  };
}
