{
  description = "Miskat's NixOS + Home Manager setup (Single profile: Niri + Caelestia Shell)";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    caelestia-shell = {
      url = "github:caelestia-dots/shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, nixvim, niri, caelestia-shell, ... }@inputs:
  let
    mkNixosSystem = { systemProfile, homeProfile }: nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      modules = [
        { nixpkgs.hostPlatform = "x86_64-linux"; }
        systemProfile
        niri.nixosModules.niri
        home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.miskat = import homeProfile;
            backupFileExtension = "backup";
            extraSpecialArgs = { inherit inputs; };
            sharedModules = [
              nixvim.homeModules.nixvim
            ];
          };
        }
      ];
    };
  in
  {
    nixosConfigurations = {
      # Single Unified Target (Niri + Caelestia Shell)
      miskat = mkNixosSystem {
        systemProfile = ./system/profiles/default.nix;
        homeProfile   = ./home/miskat/profiles/default.nix;
      };
    };
  };
}
