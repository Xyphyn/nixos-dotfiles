{ inputs, pkgs, config, ... }:

{
    home.stateVersion = "23.05";
    imports = [
        ./nvim
        ./gnomeExtensions.nix
        ./code.nix
        ./git.nix
	./zsh.nix
	./browser.nix
	./recording.nix
    ];
}
