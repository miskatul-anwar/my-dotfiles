{config, pkgs, ... }: {
  imports = [
    ./modules/git.nix
    ./modules/files.nix
    ./modules/env.nix
    ./modules/shell.nix
    ./modules/packages.nix
    ./modules/window-manager/waybar.nix
    ./modules/window-manager/hyprland.nix
  ];

  home = {
    username = "miskat";
    homeDirectory = "/home/miskat";
    stateVersion="25.05";
  };

  programs.home-manager.enable = true;
}
