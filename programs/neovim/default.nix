{ config, pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
  };
  programs.nixvim = {
    enable = true;
    colorschemes.nord = {
      enable = true;
      borders = true;
    };
    plugins = {
      bufferline.enable = true;
      coq-nvim = {
        enable = true;
	autostart = "shut-up";
	installArtifacts = true;
      };
      lsp = {
        enable = true;
	servers = {
	  clangd.enable = true;
	  eslint = true;
	  pyright.enable = true;
	  rnix-lsp.enable = true;
	  rust-analyzer = true;
	};
	setupWrappers = [ ''require("coq").lsp_ensure_capabilities'' ];
      };
      lualine = {
        enable = true;
	extensions = [ "NvimTree" ];
	theme = "Nord";
      };
      nvim-autopairs.enable = true;
      nvim-tree = {
        enable = true;
	disableNetrw = true;
	git.enable = true;
	openOnSetup = true;
	updateCwd = true;
      };
      treesitter.enable = true;
    };
  };
}
