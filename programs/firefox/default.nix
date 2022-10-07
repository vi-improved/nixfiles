{ config, pkgs, ... }:

{
  home-manager.users.vi.programs.firefox = {
    enable = true;
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
      };
    };
  };
}
