{ config, pkgs, ... }:

{
  home-manager.users.vi.services.redshift = {
    enable = true;
    latitude = 44.743783;
    longitude = -85.660788;
  };
}
