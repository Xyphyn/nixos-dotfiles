{ lib, config, pkgs, ...}:

with lib;
let
  cfg = config.modules.browser;
in
{
  options.modules.browser = { enable = mkEnableOption "browser"; };

  config = mkIf cfg.enable {
    programs.librewolf = {
      enable = true;
      settings = {
        "middlemouse.paste" = false;
	"general.autoScroll" = true;
	"gnomeTheme.hideSingleTab" = true;
	"gnomeTheme.hideWebrtcIndicator" = true;
      };
    };
  };
}
