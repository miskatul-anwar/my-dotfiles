{ config, pkgs, ... }:

{
  # enable hyprland
  programs.hyprland.enable = true;
  programs.hyprland.xwayland.enable = true;
  ###################################
  ##  Display and Desktop (GNOME)
  ###################################

  services.xserver.enable = true;
  services.xserver.xkb.layout = "us";
  services.xserver.xkb.variant = "";

  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;

  # Set default session for display manager
  services.displayManager.defaultSession = "gnome";
  # Enable GNOME's Wayland session
  services.displayManager.gdm.wayland = true;

  ###################################
  ##  Core System Packages (GNOME + Ubuntu experience)
  ###################################
  environment.systemPackages = with pkgs; [
    # GNOME core apps (top-level, not gnome.gnome-*)
    gnome-shell
    gnome-menus
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

    # GNOME Tweaks & Extensions Manager
    gnome-tweaks
    gnome-extension-manager

    # Yaru theme packages (icons, GTK, cursors)
    yaru-theme

    # Papirus icons (optional, for completeness)
    papirus-icon-theme

    # Fonts (matching Ubuntu)
    noto-fonts
    noto-fonts-color-emoji
    dejavu_fonts
    liberation_ttf
    ubuntu-classic

    # Common Ubuntu apps
    firefox
    thunderbird
    transmission_4-gtk
    transmission_3-gtk
    rhythmbox
    cheese
    shotwell
    simple-scan
    xclip
    htop
    flameshot
    filezilla
    vlc
    gimp
    libreoffice-fresh
    p7zip
    gparted
    baobab

    # System tray/network/bluetooth
    networkmanagerapplet
    blueman
    ####################################
    ## Gnome Shell Extensions
    ###################################
    gnomeExtensions.rounded-window-corners-reborn
    gnomeExtensions.arcmenu
    gnomeExtensions.caffeine
    gnomeExtensions.dash-to-dock
    gtop
  ];

  ###################################
  ##  System Services
  ###################################
  services.dbus.enable = true;
  services.udisks2.enable = true;
  services.blueman.enable = true;
  services.printing.enable = true;         # CUPS printing
  services.avahi.enable = true;            # network discovery
  services.power-profiles-daemon.enable = true; # power management

  programs.dconf.enable = true; # for some settings
  security.polkit.enable = true;

  ###################################
  ##  Power & Session Management
  ###################################
  powerManagement.enable = true;

  services.logind.settings = {
    Login = {
      HandlePowerKey = "poweroff";
      HandleSuspendKey = "suspend";
      HandleLidSwitch = "suspend";
    };
  };

  ###################################
  ##  Bluetooth
  ###################################
  hardware.bluetooth.enable = true;

  ###################################
  ##  Fonts
  ###################################
  fonts.packages = with pkgs; [
    inter
    noto-fonts
    noto-fonts-color-emoji
    dejavu_fonts
    liberation_ttf
    ubuntu-classic
  ];

}
