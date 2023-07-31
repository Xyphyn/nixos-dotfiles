{ lib, config, pkgs, ...}:

with lib;
let
  cfg = config.modules.recording;
in
{
  options.modules.recording = { enable = mkEnableOption "recording"; };

  config = mkIf cfg.enable {
    programs.obs-studio = {
      enable = true;
    };
  };
}
