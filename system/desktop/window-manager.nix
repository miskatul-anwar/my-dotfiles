{ inputs, pkgs, ... }:
{
  # Hyprland — Wayland compositor (installs the GDM session entry)
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  # XDG desktop portal (needed for screen sharing, file pickers under Hyprland)
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
  };

  environment.systemPackages = with pkgs; [
    # Wayland shell / bars / launchers
    waybar
    rofi          # rofi-wayland has been merged into rofi
    fuzzel
    swaybg
    awww          # swww was renamed to awww
    wlogout
    eyedropper

    # Hyprland ecosystem
    hyprlock
    hypridle
    hyprpaper
    hyprpicker

    # Notifications
    dunst
    libnotify

    # Terminal emulators
    alacritty
    kitty
    ghostty

    # XWayland bridge for X11 apps on Wayland
    xwayland-satellite

    # Clipboard + screenshot
    wl-clipboard
    xclip
    grim
    slurp

    # Media controls
    playerctl
    pamixer
    brightnessctl
  ];
}
