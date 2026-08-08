# Niri + Caelestia Shell Desktop Module Entry Point
{ inputs, pkgs, ... }:
{
  imports = [
    ./config.nix
  ];

  home.packages = [
    inputs.caelestia-shell.packages.${pkgs.system}.with-cli
  ];
}
