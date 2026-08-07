{ pkgs, ... }:
{
  # X11 / display server (also needed for NVIDIA + Wayland)
  services.xserver = {
    enable = true;
    xkb.layout = "us";
    xkb.variant = "";
  };

  # GDM — session picker for both GNOME and Hyprland
  services.displayManager = {
    gdm.enable = true;  # gdm.wayland removed in GNOME 50 — Wayland is always on
    defaultSession = "hyprland"; # Hyprland boots by default; GNOME selectable from picker
  };

  services.desktopManager.gnome.enable = true;

  xdg.menus.enable = true;

  # XDG default applications
  xdg.mime = {
    enable = true;
    defaultApplications = {
      "x-scheme-handler/http"    = [ "google-chrome.desktop" ];
      "x-scheme-handler/https"   = [ "google-chrome.desktop" ];
      "text/html"                = [ "google-chrome.desktop" ];
      "application/xhtml+xml"   = [ "google-chrome.desktop" ];
      "x-terminal-emulator"     = [ "kitty.desktop" ];
    };
  };

  environment.systemPackages = with pkgs; [
    # GNOME core apps
    gnome-terminal
    nautilus
    gedit
    gnome-calculator
    gnome-system-monitor
    gnome-screenshot
    gnome-disk-utility
    gnome-control-center
    eog
    evince
    file-roller
    gnome-maps
    totem
    gnome-characters
    gnome-font-viewer
    gnome-logs
    gnome-contacts
    gnome-weather

    # GNOME tools
    gnome-tweaks
    gnome-extension-manager

    # Themes & Icons
    adw-gtk3
    adwaita-qt
    papirus-icon-theme
    tela-circle-icon-theme

    # Common desktop apps
    transmission_4-gtk
    rhythmbox
    cheese
    shotwell
    simple-scan
    flameshot
    filezilla
    vlc
    gimp
    libreoffice-fresh
    p7zip
    gparted
    baobab

    # System tray / network / bluetooth
    networkmanagerapplet
    blueman

    # GNOME Shell Extensions
    gnomeExtensions.rounded-window-corners-reborn
    gnomeExtensions.caffeine
    gnomeExtensions.dash-to-dock
    gnomeExtensions.blur-my-shell
  ];

  # Core system services
  services.dbus.enable = true;
  services.udisks2.enable = true;
  services.blueman.enable = true;
  services.printing.enable = true;
  services.avahi.enable = true;
  services.power-profiles-daemon.enable = true;

  programs.dconf.enable = true;
  security.polkit.enable = true;

  powerManagement.enable = true;

  services.logind.settings = {
    Login = {
      HandlePowerKey   = "poweroff";
      HandleSuspendKey = "suspend";
      HandleLidSwitch  = "suspend";
    };
  };

  hardware.bluetooth.enable = true;
}
