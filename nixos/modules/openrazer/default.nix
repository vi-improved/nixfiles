{ config, pkgs, ... }:

{
  hardware.openrazer = {
    enable = true;
    devicesOffOnScreensaver = true;
  };
}
