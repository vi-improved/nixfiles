{ config, pkgs, ... }:

{
  imports = [
    ../../desktop
    ../utils
  ];
  services = {
    xserver = {
      displayManager.startx.enable = true; enable = true;
      windowManager.xmonad = {
        config = ./xmonad.hs;
        enable = true;
	enableConfiguredRecompile = true;
        enableContribAndExtras = true;
      };
    };
  };
  home-manager.users.vi.home.file = {
    xinitrc = { text = builtins.readFile ../xinitrc + "exec xmonad"; target = ".xinitrc"; };
    xmonad = { source = ./xmonad.hs; target = ".config/xmonad/xmonad.hs"; };
  };
  home-manager.users.vi.programs.xmobar = {
    enable = true;
    extraConfig = ''
      Config { font = "xft: Hack Nerd Font-11"
             , bgColor = "#2e3440"
             , fgColor = "#d8dee9"
             , position = Top
             , allDesktops = True
             , borderWidth = 0
             , commands =
                 [ Run Network "enp39s0"
                     [ "-L", "0"
                     , "-H", "32"
                     , "--normal", "#a3be8c"
                     , "--high", "#bf616a"
                     ] 10
                 , Run Cpu
                     [ "-L", "3"
                     , "-H", "50"
                     , "--normal", "#a3be8c"
                     , "--high", "#bf616a"
                     ] 10
                 , Run Memory ["-t", "Mem: <usedratio>%"] 10
                 , Run Swap [] 10
                 , Run Battery [] 10
                 , Run Date "%a %Y-%m-%d %H:%M:%S" "date" 10
                 , Run XMonadLog
                 ]
             , sepChar = "%"
             , alignSep = "}{"
             , template = "%XMonadLog% }{ %cpu% | %memory% | %swap% | %battery% | %date% "
             }
    '';
  };
}
