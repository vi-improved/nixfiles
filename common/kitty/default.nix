{ config, pkgs, ... }:

{
  home-manager.users.vi.programs.kitty = {
    enable = true;
    font = {
      package = (pkgs.nerdfonts.override { fonts = [ "Hack" ]; });
      name = "Hack Nerd Font";
      size = 11;
    };
    settings = {
      enable_audio_bell = false;
      tab_bar_edge = "top";
      confirm_os_window_close = 0;
    };
    theme = "Nord";
  };
}
