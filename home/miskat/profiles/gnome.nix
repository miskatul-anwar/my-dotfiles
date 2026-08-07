# GNOME User Profile — Stock Adwaita Theme, Icons & Default Cursor (Excludes Hyprland/Waybar/SwayNC)
{ pkgs, ... }:
{
  imports = [
    ./common.nix
    ../modules/terminal/ghostty.nix
  ];

  home.sessionVariables = {
    TERMINAL            = "ghostty";
    XDG_CURRENT_DESKTOP = "GNOME";
    XDG_SESSION_DESKTOP = "GNOME";
  };

  home.pointerCursor = {
    enable     = true;
    gtk.enable = true;
    x11.enable = true;
    package    = pkgs.adwaita-icon-theme;
    name       = "Adwaita";
    size       = 24;
  };

  gtk = {
    enable = true;
    theme = {
      name    = "Adwaita-dark";
      package = pkgs.gnome-themes-extra;
    };
    iconTheme = {
      name    = "Adwaita";
      package = pkgs.adwaita-icon-theme;
    };
    cursorTheme = {
      name    = "Adwaita";
      package = pkgs.adwaita-icon-theme;
      size    = 24;
    };
    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
    gtk4.theme = null;
    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
  };

  qt = {
    enable = true;
    platformTheme.name = "gtk3";
    style = {
      name    = "adwaita-dark";
      package = pkgs.adwaita-qt;
    };
  };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme        = "prefer-dark";
      gtk-theme           = "Adwaita-dark";
      icon-theme          = "Adwaita";
      cursor-theme        = "Adwaita";
      cursor-size         = 24;
      font-name           = "Inter 10";
      monospace-font-name = "JetBrainsMono Nerd Font 10";
    };
    "org/gnome/desktop/wm/preferences" = {
      button-layout = "appmenu:minimize,maximize,close";
    };
  };
}
