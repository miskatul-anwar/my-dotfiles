# Niri Scrollable-Tiling Compositor & Dank Material Shell System Setup
{ pkgs, ... }:
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

    # Theme & Color Generator (Material You / Material 3)
    matugen

    # Launcher, Shell & Utilities
    rofi
    fuzzel
    waybar
    swaybg
    swaylock
    swayidle
    swaynotificationcenter
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
