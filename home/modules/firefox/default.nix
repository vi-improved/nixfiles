{ config, pkgs, lib, ... }:

{
  home.file = {
    prefs = {
      source = ../../files/firefox/prefs.js;
      target = ".mozilla/firefox/vi/prefs.js";
    };
  };
  programs.firefox = {
    enable = true;
    profiles = {
      vi = {
        extraConfig = builtins.readFile ../../files/firefox/user.js;
	isDefault = true;
        name = "vi";
      };
    };
  };
}
