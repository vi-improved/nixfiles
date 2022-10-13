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
    extensions = with pkgs.nur.repos.rycee.firefox-addons; [
      bitwarden
      ublock-origin
      darkreader
      sponsorblock
      stylus
    ];
    profiles = {
      vi = {
        extraConfig = builtins.readFile ../../files/firefox/user.js;
	isDefault = true;
        name = "vi";
      };
    };
  };
}
