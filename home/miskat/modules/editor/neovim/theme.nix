# Neovim Theme Configuration — Adwaita Dark Aesthetic
{ pkgs, ... }:
{
  programs.nixvim = {
    extraPlugins = [
      pkgs.vimPlugins.adwaita-nvim
    ];
    colorscheme = "adwaita";
  };
}
