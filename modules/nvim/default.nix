{ lib, config, pkgs, ... }:
with lib;
let
  cfg = config.modules.nvim;
in {
  options.modules.nvim = { enable = mkEnableOption "nvim"; };
  config = mkIf cfg.enable {
    home.file.".config/nvim/settings.lua".source = ./init.lua;

    programs.zsh = {
      initExtra = ''
        export EDITOR="nvim"
      '';

      shellAliases = {
        v = "nvim";
        vim = "nvim";
      };
    };

    programs.neovim = {
      enable = true;
      plugins = with pkgs.vimPlugins; [
        nerdtree
	vim-airline
        vim-airline-themes
	onedark-nvim
      ];
      extraConfig = ''
        luafile ~/.config/nvim/settings.lua
      '';
    };
  };
}
