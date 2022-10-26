{ config, pkgs, ... }:

{
  home-manager.users.vi = {
    imports = [
      ../../home
      ../../home/modules/kitty
    ];
    home.stateVersion = "22.11";
  };
}
