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
      {
        name = "fig";
        url = "https://fig.io/";
      }
      {
        name = "m-cli";
        url = "https://github.com/rgcr/m-cli";
      }
      {
        name = "xbar";
        url = "https://xbarapp.com/";
      }
      {
        name = "the unarchiver";
        url = "https://theunarchiver.com/";
      }
      {
        name = "sensiblesidebuttons";
        url = "https://sensible-side-buttons.archagon.net/";
      }
      {
        name = "AltTab";
        url = "https://alt-tab-macos.netlify.app/";
      }
      {
        name = "actions";
        url = "https://github.com/sindresorhus/Actions";
      }
      {
        name = "Background Music";
        url = "https://github.com/kyleneideck/BackgroundMusic";
      }
      {
        name = "GokuRakuJoudo";
        url = "https://github.com/yqrashawn/GokuRakuJoudo";
      }
      {
        name = "Spotter";
        url = "https://github.com/spotter-application/spotter";
      }
      {
        name = "MTMR";
        url = "https://github.com/toxblh/MTMR";
      }
      {
        name = "Ubersicht";
        url = "https://github.com/felixhageloh/uebersicht";
      }
      {
        name = "Hammerspoon";
        url = "https://github.com/Hammerspoon/hammerspoon";
      }
      {
        name = "PaperWM";
        url = "https://github.com/paperwm/PaperWM";
      }
      {
        name = "Blur my Shell";
        url = "https://github.com/aunetx/blur-my-shell";
      }
      {
        name = "Firefox KDE";
        url = "https://build.opensuse.org/package/show/mozilla:Factory/MozillaFirefox";
      }
      {
        name = "musnix";
        url = "https://github.com/musnix/musnix";
      }
      {
        name = "nixpkgs-firefox-darwin";
        url = "https://github.com/bandithedoge/nixpkgs-firefox-darwin";
      }
      {
        name = "nixpkgs-wayland";
        url = "https://github.com/nix-community/nixpkgs-wayland";
      }
      {
        name = "vim-easy-align";
        url = "https://github.com/junegunn/vim-easy-align";
      }
      {
        name = "null-ls.nvim";
        url = "https://github.com/jose-elias-alvarez/null-ls.nvim";
      }
      {
        name = "glow.nvim";
        url = "https://github.com/ellisonleao/glow.nvim";
      }
      {
        name = "telescope-repo.nvim";
        url = "https://cj.rs/telescope-repo-nvim/";
      }
      {
        name = "presence.nvim";
        url = "https://github.com/andweeb/presence.nvim";
      }
      {
        name = "neorg";
        url = "https://github.com/nvim-neorg/neorg";
      }
      {
        name = "mkdir.nvim";
        url = "https://github.com/jghauser/mkdir.nvim";
      }
      {
        name = "ripgrep";
        url = "https://github.com/BurntSushi/ripgrep";
      }
      {
        name = "themer";
        url = "https://github.com/themerdev/themer";
      }
      {
        name = "elvish";
        url = "https://elv.sh/";
      }
      {
        name = "Nushell";
        url = "https://github.com/nushell/nushell";
      }
      {
        name = "Oil";
        url = "https://www.oilshell.org/";
      }
      {
        name = "yash";
        url = "https://yash.osdn.jp/";
      }
      {
        name = "exa";
        url = "https://the.exa.website/";
      }
      {
        name = "Hydro";
        url = "https://github.com/jorgebucaran/hydro";
      }
      {
        name = "Done";
        url = "https://github.com/franciscolourenco/done";
      }
      {
        name = "mps-youtube";
        url = "https://github.com/mps-youtube/mps-youtube";
      }
      {
        name = "timewarrior";
        url = "https://github.com/GothenburgBitFactory/timewarrior";
      }
      {
        name = "taskwarrior";
        url = "https://taskwarrior.org/";
      }
      {
        name = "cli-fireplace";
        url = "https://github.com/dolsup/cli-fireplace";
      }
      {
        name = "BSDNow";
        url = "https://www.bsdnow.tv/";
      }
      {
        name = "ChucK";
        url = "https://github.com/ccrma/chuck";
      }
      {
        name = "Faust";
        url = "https://faust.grame.fr/";
      }
      {
        name = "Direct Links Out";
        url = "https://openuserjs.org/scripts/nokeya/Direct_links_out";
      }
      {
        name = "URL Shortener Unshortener";
        url = "https://greasyfork.org/en/scripts/5359-url-shortener-unshortener";
      }
      {
        name = "Anti-Adblock Killer";
        url = "http://reek.github.io/anti-adblock-killer/";
      }
      {
        name = "Image Max URL";
        url = "https://openuserjs.org/scripts/qsniyg/Image_Max_URL";
      }
      {
        name = "hide youtube recommendations";
        url = "https://github.com/artli/hide-youtube-recommendations";
      }
      {
        name = "Purism";
        url = "https://puri.sm/";
      }
      {
        name = "ThinkPenguin";
        url = "https://www.thinkpenguin.com/";
      }
      {
        name = "Vikings";
        url = "https://vikings.net/";
      }
      {
        name = "Linux Preloaded";
        url = "https://linuxpreloaded.com/";
      }
	];
        userChrome = builtins.readFile ./userChrome.css;
      };
    };
  };
}
