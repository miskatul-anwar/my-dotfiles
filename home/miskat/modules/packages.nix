{ pkgs, ... }:
{
  # Add user-specific packages here (beyond system-wide packages)
  # zen-browser removed — install via flatpak or add a new flake input if needed
  home.packages = with pkgs; [ ];
}
