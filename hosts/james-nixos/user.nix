{ config, lib, inputs, ... }:

{
  imports = [
    ../../modules/default.nix
  ];
  
  config.modules = {
    code.enable = true;
    git.enable = true;
    gnomeExtensions.enable = true;
    zsh.enable = true;
    nvim.enable = true;
  };
}
