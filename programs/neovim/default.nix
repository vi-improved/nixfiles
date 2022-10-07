{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs.vimPlugins; [
    bufferline-nvim
    lualine-nvim
    coq_nvim
    nord-nvim
    nvim-tree-lua
  ];
  programs.neovim = {
    configure = {
      customRC = ''
        lua << EOF
        ${builtins.readFile ./init.lua}
        EOF
      '';
      packages.myVimPackage = with pkgs.vimPlugins; {
        start = [ bufferline-nvim lualine-nvim coq_nvim nord-nvim nvim-tree-lua ];
      };
    };
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
  };
}
