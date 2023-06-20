{
    description = "Home Manager configuration of James";

    inputs = {
        # Specify the source of Home Manager and Nixpkgs.
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = { nixpkgs, home-manager, ... }@inputs:
        let
        system = "x86_64-linux";
        pkgs = nixpkgs.legacyPackages.${system};
        lib = nixpkgs.lib;
        # This lets us reuse the code to "create" a system
        # Credits go to sioodmy on this one!
        # https://github.com/sioodmy/dotfiles/blob/main/flake.nix
        mkSystem = pkgs: system: hostname:
            pkgs.lib.nixosSystem {
                system = system;
                modules = [
                    { networking.hostName = hostname; }
                    # General configuration (users, networking, sound, etc)
                    ./configuration.nix
                    # Hardware config (bootloader, kernel modules, filesystems, etc)
                    # DO NOT USE MY HARDWARE CONFIG!! USE YOUR OWN!!
                    (./. + "/hosts/${hostname}/hardware-configuration.nix")
                    home-manager.nixosModules.home-manager
                    {
                        home-manager = {
                            useUserPackages = true;
                            useGlobalPkgs = true;
                            extraSpecialArgs = { inherit inputs; };
                            # Home manager config (configures programs like firefox, zsh, eww, etc)
                            users.james = (./. + "/hosts/${hostname}/user.nix");
                        };
                    }
                ];
                specialArgs = { inherit inputs; };
            };
        in {
            nixosConfigurations = {
                james-nixos = mkSystem inputs.nixpkgs "x86_64-linux" "james-nixos";
            };
        };
    }
