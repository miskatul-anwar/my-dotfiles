{ inputs, config, pkgs, ... }:
let 
  pkgs-unstable = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system};
in
{
  programs.hyprland = {
    enable = true;

    # Use Hyprland from the flake input
    package = pkgs-unstable.hyprland;

    # Use the matching portal package for consistency
    portalPackage = pkgs-unstable.xdg-desktop-portal-hyprland;
  };

  # hardware.graphics = {
  #   package = pkgs-unstable.mesa;
  #   enable32Bit = true;
  #   package32 = pkgs-unstable.pkgsi686Linux.mesa;
  # };

  environment.systemPackages = with pkgs; [
    kitty
  ];
}
