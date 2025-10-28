{config, pkgs, ... }: {
  imports = [
    ./modules/git.nix
    ./modules/files.nix
    ./modules/env.nix
    ./modules/shell.nix
    ./modules/packages.nix
    ./modules/window-manager/hyprland.nix
  ];

  home = {
    username = "miskat";
    homeDirectory = "/home/miskat";
    stateVersion="25.05";

    file = {
      ".config/kitty/kitty.conf".source = ./kitty/kitty.conf;
      ".config/dunst/dunstrc".source = ./dunst/dunstrc;
      ".config/hypr/hyprland.conf".source = ./hypr/hyprland.conf;
      ".config/hypr/hypridle.conf".source = ./hypr/hypridle.conf;
      ".config/hypr/hyprlock.conf".source = ./hypr/hyprlock.conf;
      ".config/tofi/configA".source = ./tofi/configA;
      ".config/tofi/configV".source = ./tofi/configV;
      ".config/waybar/config.jsonc".source = ./waybar/config.jsonc;
      ".config/waybar/style.css".source = ./waybar/style.css;
      ".config/wlogout/style.css".source = ./wlogout/style.css;
      ".config/wlogout/layout".source = ./wlogout/layout;
    };
  };


  

  programs.home-manager.enable = true;
}
