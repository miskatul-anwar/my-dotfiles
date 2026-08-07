{
  description = "Miskat's NixOS + Home Manager setup (Flake profiles for Hyprland & GNOME)";

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
  };

  outputs = { nixpkgs, home-manager, nixvim, ... }@inputs:
  let
    mkNixosSystem = { systemProfile, homeProfile }: nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      modules = [
        { nixpkgs.hostPlatform = "x86_64-linux"; }
        systemProfile
        home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.miskat = import homeProfile;
            backupFileExtension = "backup";
            extraSpecialArgs = { inherit inputs; };
            sharedModules = [ nixvim.homeModules.nixvim ];
          };
        }
      ];
    };
  in
  {
    nixosConfigurations = {
      # Default host target (Hyprland profile)
      miskat = mkNixosSystem {
        systemProfile = ./system/profiles/hyprland.nix;
        homeProfile   = ./home/miskat/profiles/hyprland.nix;
      };

      # Explicit Hyprland Profile (Catppuccin Mocha Lavender, Tela icons, Bibata cursor, Waybar, SwayNC, Rofi)
      miskat-hyprland = mkNixosSystem {
        systemProfile = ./system/profiles/hyprland.nix;
        homeProfile   = ./home/miskat/profiles/hyprland.nix;
      };

      # Explicit GNOME Profile (Stock Adwaita theme, Adwaita icons, Adwaita cursor, GNOME DE)
      miskat-gnome = mkNixosSystem {
        systemProfile = ./system/profiles/gnome.nix;
        homeProfile   = ./home/miskat/profiles/gnome.nix;
      };
    };
  };
}
