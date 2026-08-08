# Single Unified User Profile — GNOME 47 Desktop Environment
{ config, pkgs, ... }:
{
  imports = [
    ./common.nix
    ../modules/desktop/default.nix
    ../modules/terminal/ghostty.nix
  ];

  home.sessionVariables = {
    TERMINAL            = "ghostty";
    XDG_CURRENT_DESKTOP = "GNOME";
    XDG_SESSION_DESKTOP = "gnome";
  };

  # Adwaita Cursor Theme
  home.pointerCursor = {
    enable     = true;
    gtk.enable = true;
    x11.enable = true;
    package    = pkgs.adwaita-icon-theme;
    name       = "Adwaita";
    size       = 24;
  };

  # Adwaita Theme, Icons & Cursor
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
    gtk4.theme = config.gtk.theme;
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
      enable-hot-corners  = false;
    };
    "org/gnome/desktop/wm/preferences" = {
      button-layout = "appmenu:minimize,maximize,close";
    };
    "org/gnome/shell" = {
      enabled-extensions = [
        "rounded-window-corners@yilozt"
        "caffeine@patapon.info"
        "dash-to-dock@micxgx.gmail.com"
        "blur-my-shell@aunetx"
        "appindicatorsupport@rgcjonas.gmail.com"
      ];
    };
    "org/gnome/shell/extensions/dash-to-dock" = {
      dock-position       = "BOTTOM";
      transparency-mode   = "FIXED";
      background-opacity  = 0.3;
      dash-max-icon-size  = 48;
      show-mounts         = false;
    };
  };
}
