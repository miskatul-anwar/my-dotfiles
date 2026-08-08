# Sway System Module — Modular Wayland Compositor Setup
{ pkgs, ... }:
{
  # Sway — Wayland tiling compositor & GDM session entry
  programs.sway = {
    enable = true;
    xwayland.enable = true;
    extraPackages = with pkgs; [
      swaylock
      swayidle
      swaybg
    ];
  };

  # XDG desktop portal for Wayland (screen sharing, file pickers)
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-wlr
      pkgs.xdg-desktop-portal-gtk
    ];
  };

  environment.systemPackages = with pkgs; [
    # Wayland shell & launcher suite
    waybar
    rofi
    fuzzel
    swaybg
    wlogout

    # Lockscreen & idle management
    swaylock
    swayidle

    # Notification daemon
    swaynotificationcenter
    libnotify

    # Terminal emulators
    kitty
    ghostty

    # Clipboard & Screenshots
    wl-clipboard
    cliphist
    grim
    slurp
    swappy

    # Media & system controls
    brightnessctl
    pamixer
    playerctl
    pavucontrol

    # File manager & TUI tools
    nautilus
    yazi

    # PolicyKit authentication agent
    polkit_gnome
  ];

  # Enable Polkit authentication service
  security.polkit.enable = true;
}
