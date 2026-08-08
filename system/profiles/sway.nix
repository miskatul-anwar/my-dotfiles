# Sway System Profile — Enables Sway compositor + Wayland suite
{ ... }:
{
  imports = [
    ./common.nix
    ../desktop/sway.nix
  ];

  # GDM Display Manager configured with Sway as default session
  services.xserver.enable = true;
  services.displayManager = {
    gdm.enable = true;
    defaultSession = "sway";
  };
}
