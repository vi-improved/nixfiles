{ config, pkgs, ... }:

{
  imports = [
    ./home.nix
    ../../darwin
    ../../darwin/modules/yabai
  ];
  networking = {
    computerName = "vitriol";
    dns = [ "192.168.1.60" "1.1.1.1" ];
    hostName = "vitriol";
  };
  users.users.vi = {
    createHome = true;
    description = "vimproved";
  };
}
