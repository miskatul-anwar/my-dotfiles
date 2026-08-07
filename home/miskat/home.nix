{ config, pkgs, ... }:
{
  imports = [
    ./modules/git.nix
    ./modules/packages.nix
    ./modules/shell/zsh.nix
    ./modules/shell/env.nix
    ./modules/shell/fastfetch.nix
    ./modules/terminal/kitty.nix
    ./modules/terminal/alacritty.nix
    ./modules/terminal/ghostty.nix
    ./modules/desktop/default.nix
  ];

  home = {
    username      = "miskat";
    homeDirectory = "/home/miskat";
    stateVersion   = "25.05";
    file          = {};

    pointerCursor = {
      enable     = true;
      gtk.enable = true;
      x11.enable = true;
      package    = pkgs.bibata-cursors;
      name       = "Bibata-Modern-Classic";
      size       = 24;
    };
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
    };
    "org/gnome/desktop/wm/preferences" = {
      button-layout = "appmenu:minimize,maximize,close";
    };
  };

  programs.home-manager.enable = true;
}
