{ config, pkgs, ... }:

{
  documentation.man = {
    man-db.enable = false;
    mandoc.enable = true;
  };
  environment = {
    defaultPackages = with pkgs; [
      rsync
      perl
      strace
    ];
    localBinInPath = true;
    variables = { EDITOR = "vi"; VISUAL = "vi"; };
  };
  fonts = {
    fontconfig.defaultFonts = {
      monospace = [ "Hack Nerd Font" ];
      sansSerif = [ "Cantarell" ];
    };
    fonts = with pkgs; [
      (nerdfonts.override { fonts = [ "Hack" ]; })
      cantarell-fonts
    ];
  };
  nix = {
    settings.experimental-features = [ "nix-command" "flakes" ];
    gc = {
      automatic = true;
      dates = "12:00";
      options = "-d";
    };
  };
  programs.dconf.enable = true;
  security = {
    doas = {
      enable = true;
      extraRules = [
        { groups = [ "wheel" ]; persist = true; setEnv = [ "NIX_PATH" ]; }
      ];
    }; 
    sudo.enable = false;
  };
  nixpkgs.config.allowUnfree = true;
}
