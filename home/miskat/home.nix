{ pkgs, ... }:
{
  imports = [
    ./modules/git.nix
    ./modules/packages.nix
    ./modules/shell/zsh.nix
    ./modules/shell/env.nix
    ./modules/terminal/kitty.nix
    ./modules/terminal/alacritty.nix
    ./modules/terminal/ghostty.nix
    ./modules/editor/codium/default.nix
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
    cursorTheme = {
      package = pkgs.bibata-cursors;
      name    = "Bibata-Modern-Classic";
      size    = 24;
    };
  };

  programs.home-manager.enable = true;
}
