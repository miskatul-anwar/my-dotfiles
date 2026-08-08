# Rofi Launcher — Sleek Glassmorphic Launcher with Tela-circle-purple icons
{ pkgs, ... }:
{
  programs.rofi = {
    enable   = true;
    package  = pkgs.rofi;
    terminal = "${pkgs.kitty}/bin/kitty";
    extraConfig = {
      icon-theme = "Tela-circle-dark";
    };
    theme = ./rofi/theme.rasi;
  };
}
