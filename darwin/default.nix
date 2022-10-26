{ config, pkgs, ... }:

{
  fonts.fonts = with pkgs; [
    (nerdfonts.override { fonts = [ "Hack" ]; })
    cantarell-fonts
  ];
  homebrew = {
    enable = true;
    casks = [
      "kitty"
      "firefox"
      "osu"
    ];
    masApps = {
      "bitwarden" = 1352778147;
    };
  };
  nix = {
    gc = {
      automatic = true;
      interval = { Hour = 12; Minute = 0; };
      options = "-d";
    };
    settings = {
      experimental-features = "nix-command flakes";
      auto-optimise-store = true;
    };
  };
  programs.zsh.enable = true;
  nixpkgs.config.allowBroken = true;
  system = {
    defaults = {
      LaunchServices.LSQuarantine = false;
      NSGlobalDomain = {
        AppleInterfaceStyle = "Dark";
        AppleShowAllExtensions = true;
        AppleShowAllFiles = true;
        NSAutomaticCapitalizationEnabled = false;
        NSAutomaticDashSubstitutionEnabled = false;
        NSAutomaticPeriodSubstitutionEnabled = false;
        NSAutomaticQuoteSubstitutionEnabled = false;
        NSAutomaticSpellingCorrectionEnabled = false;
        NSDocumentSaveNewDocumentsToCloud = false;
        "com.apple.swipescrolldirection" = false;
      };
      dock = {
        autohide = true;
        mru-spaces = false;
        show-recents = false;
      };
      finder = {
        AppleShowAllExtensions = true;
        AppleShowAllFiles = true;
        FXEnableExtensionChangeWarning = false;
        QuitMenuItem = true;
        _FXShowPosixPathInTitle = true;
      };
      loginwindow.GuestEnabled = false;
    };
    stateVersion = 4;
  };
}
