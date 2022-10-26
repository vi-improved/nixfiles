{ config, pkgs, lib, ... }:

{
  boot = {
    loader = {
      systemd-boot.enable = true;
      timeout = 0;
    };
    extraModprobeConfig = ''
      options hid_apple swap_fn_leftctrl=1
      options hid_apple swap_opt_cmd=1
    '';
    kernelParams = [ "quiet" "loglevel=3" ];
  };
}
