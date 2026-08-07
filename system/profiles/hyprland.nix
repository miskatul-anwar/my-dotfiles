# Hyprland System Profile — Enables Hyprland compositor + Wayland suite
{ ... }:
{
  imports = [
    ./common.nix
    ../desktop/window-manager.nix
  ];

  # GDM Display Manager configured with Hyprland as default session
  services.xserver.enable = true;
  services.displayManager = {
    gdm.enable = true;
    defaultSession = "hyprland";
  };
}
