# Single Unified User Profile — GNOME 47 Desktop Environment
{ config, pkgs, ... }:
{
  imports = [
    ./common.nix
    ../modules/desktop/default.nix
    ../modules/terminal/ghostty.nix
    ../modules/terminal/kitty.nix
  ];

  home.sessionVariables = {
    TERMINAL            = "ghostty";
    XDG_CURRENT_DESKTOP = "GNOME";
    XDG_SESSION_DESKTOP = "gnome";
  };

  home.pointerCursor = {
    enable     = true;
    gtk.enable = true;
    x11.enable = true;
    package    = pkgs.bibata-cursors;
    name       = "Bibata-Modern-Classic";
    size       = 24;
  };

  gtk = {
    enable = true;
    theme = {
      name    = "catppuccin-mocha-lavender-standard";
      package = (pkgs.catppuccin-gtk.override { accents = [ "lavender" ]; variant = "mocha"; });
    };
    iconTheme = {
      name    = "Tela-circle-dark";
      package = pkgs.tela-circle-icon-theme;
    };
    cursorTheme = {
      name    = "Bibata-Modern-Classic";
      package = pkgs.bibata-cursors;
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
      gtk-theme           = "catppuccin-mocha-lavender-standard";
      icon-theme          = "Tela-circle-dark";
      cursor-theme        = "Bibata-Modern-Classic";
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
