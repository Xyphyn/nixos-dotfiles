{ lib, config, pkgs, ...}:

with lib;
let
  cfg = config.modules.fonts;
in
{
  options.modules.fonts = { enable = mkEnableOption "fonts"; };

  config = mkIf cfg.enable {
    fonts = {
      fonts = with pkgs; [
        cantarell-fonts
        jetbrains-mono
      ];
      fontDir.enable = true;
    };
  };
}
