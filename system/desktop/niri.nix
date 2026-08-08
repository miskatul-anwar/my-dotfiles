# Niri Scrollable-Tiling Compositor & Caelestia Shell System Setup
{ pkgs, inputs, ... }:
{
  # Enable Niri Wayland compositor
  programs.niri = {
    enable = true;
    package = pkgs.niri;
  };

  # GDM Display Manager configured with Niri as default session
  services.xserver.enable = true;
  services.displayManager = {
    gdm.enable = true;
    defaultSession = "niri";
  };

  # XDG desktop portals for Niri & Wayland screen sharing / file pickers
  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gnome
      pkgs.xdg-desktop-portal-gtk
    ];
  };

  environment.systemPackages = with pkgs; [
    # Niri & XWayland bridge
    niri
    xwayland-satellite

    # Caelestia Shell & CLI
    inputs.caelestia-shell.packages.${pkgs.system}.with-cli

    # Theme & Color Generator (Material You / Matugen)
    matugen

    # Shell & Desktop Utilities
    swaybg
    swaylock
    swayidle
    libnotify

    # Terminal Emulators
    kitty
    ghostty

    # Clipboard & Screenshot tools
    wl-clipboard
    cliphist
    grim
    slurp
    swappy

    # Media & Hardware Controls
    brightnessctl
    pamixer
    playerctl
    pavucontrol

    # File Managers & Authentication
    nautilus
    yazi
    polkit_gnome

    # Icons & Cursors
    papirus-icon-theme
    tela-circle-icon-theme
    bibata-cursors
  ];

  # Security & Polkit authentication service
  security.polkit.enable = true;
}
