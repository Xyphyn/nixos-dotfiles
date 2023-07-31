{ lib, config, pkgs, ... }:

with lib;
let
  cfg = config.modules.gnomeExtensions;
in
{
  options.modules.gnomeExtensions = { enable = mkEnableOption "gnomeExtensions"; };
  
  config = mkIf cfg.enable {
    home.packages = [
      # extensions
      pkgs.gnomeExtensions.rounded-window-corners
      pkgs.gnomeExtensions.dash-to-dock
      pkgs.gnomeExtensions.blur-my-shell
      pkgs.gnomeExtensions.appindicator

      # apps
      pkgs.clapper
    ];

    home.sessionVariables = {
      TERMINAL = "kgx";
    };
  };
}
