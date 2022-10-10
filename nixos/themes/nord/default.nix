{ config, pkgs, ... }:

{
  home-manager.users.vi = {
    home = {
      file = {
        gtk4 = {
          source = ./gtk.css;
          target = ".config/gtk-4.0/gtk.css";
        };
        gtk3 = {
          source = ./gtk.css;
          target = ".config/gtk-3.0/gtk.css";
        };
      };
      pointerCursor = {
        package = pkgs.nordzy-cursor-theme;
        name = "Nordzy-cursors";
        gtk.enable = true;
      };
    };
    gtk = {
      enable = true;
      iconTheme = {
        package = pkgs.papirus-icon-theme;
        name = "Papirus-Dark";
      };
      theme = {
        package = pkgs.adw-gtk3;
        name = "adw-gtk3-dark";
      };
    };
    programs.dircolors = {
      enable = true;
      extraConfig = builtins.readFile ./dir_colors;
    };
    xresources.extraConfig = builtins.readFile ./nord.Xresources;
  };
}
