{ lib, config, pkgs, ...}:

with lib;
let
  cfg = config.modules.zsh;
in
{
  options.modules.zsh = { enable = mkEnableOption "zsh"; };

  config = mkIf cfg.enable {
    programs.zsh = {
        enable = true;
        shellAliases = {
          l = "ls -l";
          vim = "nvim";
	  s = "sudo";
        };
        oh-my-zsh = {
        enable = true;
        plugins = [ "git" ];
        theme = "robbyrussell";
        extraConfig = ''
            ZSH_AUTOSUGGEST_STRATEGY=(history completion)
        '';
        };
        enableSyntaxHighlighting = true;
        enableCompletion = true;
        enableAutosuggestions = true;
    };
  };
}
