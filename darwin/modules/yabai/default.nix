{ config, pkgs, ... }:

{
  homebrew.brews = [
    "koekeishiya/formulae/yabai"
    "koekeishiya/formulae/skhd"
  ];
  homebrew.taps = [
    "koekeishiya/formulae"
  ];
  services = {
    skhd = {
      package = pkgs.runCommand "yabai-0.0.0" { } "mkdir $out";
      enable = true;
    };
    yabai = {
      package = pkgs.runCommand "yabai-0.0.0" { } "mkdir $out";
      enable = true;
      enableScriptingAddition = true;
    };
  };
}
