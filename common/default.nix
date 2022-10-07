{ config, pkgs, ... }:
{
  imports = [
    ../programs/bat
    ../programs/btop
    ../programs/git
  ];
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  home-manager.users.vi = {
    programs.dircolors.enable = true;
    news.display = "silent";
  };
}
