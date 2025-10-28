{ inputs, config, pkgs, ... }:

{
  programs.hyprland = {
    enable = true;

    # Use Hyprland from the flake input
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;

    # Use the matching portal package for consistency
    portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
  };

  environment.systemPackages = with pkgs; [
    kitty
  ];
}
