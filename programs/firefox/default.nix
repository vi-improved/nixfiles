{ config, pkgs, ... }:

{
  home-manager.users.vi.home.file =
  {
      nordic = { source = ./nordic; target = ".mozilla/firefox/vi/chrome/nordic"; recursive = true; };
  };
  home-manager.users.vi.programs.firefox = {
    enable = true;
    extensions = with config.nur.repos.rycee.firefox-addons; [
      ublock-origin
      bitwarden
    ];
    profiles = {
      vi = {
        id = 0;
	isDefault = true;
	extraConfig = builtins.readFile ./user.js;
	bookmarks = [
	  {
	    name = "nixos options";
	    url = "https://nixos.org/manual/nixos/unstable/options.html";
	  }
	  {
	    name = "home-manager options";
	    url = "https://nix-community.github.io/home-manager/options.html";
	  }
	];
        userChrome = builtins.readFile ./userChrome.css;
      };
    };
  };
}
