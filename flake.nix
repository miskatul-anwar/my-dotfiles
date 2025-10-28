{
  description = "Miskat's NixOS + Home Manager setup (flake-based)";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }:
  let
    system = "x86_64-linux";
  in {
    nixosConfigurations.miskat = nixpkgs.lib.nixosSystem {
      inherit system;

      modules = [
        ./system/configuration.nix
        ./system/hardware/hardware-configuration.nix

        # Home Manager integration
        home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.miskat = import ./home/miskat/home.nix;
            backupFileExtension = "backup";
          };
        }
      ];
    };
  };
}

