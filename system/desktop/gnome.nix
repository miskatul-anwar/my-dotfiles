# GNOME 47 Desktop Environment Subsystem
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

  # System Desktop Applications & Tools
  environment.systemPackages = with pkgs; [
    # Core GNOME Applications
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

    # GNOME Tweaks & Extension Manager
    gnome-tweaks
    gnome-extension-manager

    # Selected GNOME Extensions
    gnomeExtensions.rounded-window-corners-reborn
    gnomeExtensions.caffeine
    gnomeExtensions.dash-to-dock
    gnomeExtensions.blur-my-shell
    gnomeExtensions.appindicator

    # Icons & Themes
    papirus-icon-theme
    tela-circle-icon-theme
    bibata-cursors

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
