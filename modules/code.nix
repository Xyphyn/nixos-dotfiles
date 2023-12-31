{ lib, config, pkgs, ...}:

with lib;
let
  cfg = config.modules.code;
in
{
  options.modules.code = { enable = mkEnableOption "code"; };

  config = mkIf cfg.enable {
    home.packages = [
      pkgs.jetbrains-mono
    
      pkgs.android-studio
    ];

    programs.vscode = {
      enable = true;
      package = pkgs.vscodium;
    };
  };
}
