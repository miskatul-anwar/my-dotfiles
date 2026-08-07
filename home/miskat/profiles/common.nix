# Shared User Profile — Inherited by both GNOME & Hyprland user environments
{ ... }:
{
  imports = [
    ../modules/git.nix
    ../modules/packages.nix
    ../modules/shell/zsh.nix
    ../modules/shell/env.nix
    ../modules/shell/fastfetch.nix
    ../modules/editor/neovim/default.nix
  ];

  home = {
    username      = "miskat";
    homeDirectory = "/home/miskat";
    stateVersion   = "25.05";
    file          = {};
  };

  programs.home-manager.enable = true;
}
