{ config, pkgs, ... }:

{
  imports = [
    ../themes/nord
  ];
  home-manager.users.vi = {
    home = {
      stateVersion = "22.11";
      username = "vi";
      homeDirectory = "/home/vi";
    };
    programs.git = {
      userName = "vimproved";
      userEmail = "vimproved@inventati.org";
    };
  };

  users.users.vi = {
    isNormalUser = true;
    extraGroups = [ "wheel" "audio" "video" ];
    shell = pkgs.fish;
  };
}
