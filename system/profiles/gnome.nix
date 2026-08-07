# GNOME System Profile — Enables GNOME 47 Desktop Environment + Stock Adwaita
{ ... }:
{
  imports = [
    ./common.nix
    ../desktop/gnome.nix
  ];

  # GDM Display Manager configured with GNOME as default session
  services.displayManager = {
    gdm.enable = true;
    defaultSession = "gnome";
  };
}
