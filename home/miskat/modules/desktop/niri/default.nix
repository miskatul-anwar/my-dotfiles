# Niri + Dank Material Shell Desktop Module Entry Point
{ inputs, pkgs, ... }:
{
  imports = [
    ./config.nix
  ];

  home.packages = [
    inputs.dank-material-shell.packages.${pkgs.system}.default
  ];
}
