# GNOME 47 Desktop Environment Subsystem — Adwaita & Ghostty Terminal Only
{ pkgs, ... }:
{
  # X11 / Display Server
  services.xserver = {
    enable = true;
    xkb.layout = "us";
    xkb.variant = "";
  };

  # GDM Display Manager configured with GNOME Wayland as default session
  services.displayManager = {
    gdm.enable = true;
    defaultSession = "gnome";
  };

  # GNOME Desktop Manager
  services.desktopManager.gnome.enable = true;

  # XDG Menu & Desktop Portals
  xdg.menus.enable = true;
  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gnome
      pkgs.xdg-desktop-portal-gtk
    ];
  };

  xdg.mime = {
    enable = true;
    defaultApplications = {
      "x-scheme-handler/http"    = [ "google-chrome.desktop" ];
      "x-scheme-handler/https"   = [ "google-chrome.desktop" ];
      "text/html"                = [ "google-chrome.desktop" ];
      "application/xhtml+xml"   = [ "google-chrome.desktop" ];
      "x-terminal-emulator"     = [ "com.mitchellh.ghostty.desktop" ];
    };
  };

  # System Desktop Applications & Tools
  environment.systemPackages = with pkgs; [
    # Ghostty — Single Dedicated Terminal Emulator
    ghostty

    # Core GNOME Applications
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

    # GNOME Tweaks & Extension Manager
    gnome-tweaks
    gnome-extension-manager

    # Selected GNOME Extensions
    gnomeExtensions.rounded-window-corners-reborn
    gnomeExtensions.caffeine
    gnomeExtensions.dash-to-dock
    gnomeExtensions.dash-to-panel
    gnomeExtensions.user-themes
    gnomeExtensions.blur-my-shell
    gnomeExtensions.appindicator
    gnomeExtensions.network-stats

    # Official Adwaita Theme, Icons & Cursors
    adwaita-icon-theme
    gnome-themes-extra

    # System Tray & Applets
    networkmanagerapplet
    blueman
  ];

  # Core Desktop Services
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
