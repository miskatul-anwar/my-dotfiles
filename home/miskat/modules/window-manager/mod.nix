{config, pkgs, ... }: {
  imports = [
    ./rofi/default.nix
    ./dunst.nix
    ./alacritty.nix
    ./hypr.nix
    ./kitty.nix
    ./waybar.nix
  ];
}