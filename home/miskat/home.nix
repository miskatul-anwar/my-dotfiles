{ ... }:
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
    username     = "miskat";
    homeDirectory = "/home/miskat";
    stateVersion  = "25.05";
    file = {};
  };

  programs.home-manager.enable = true;
}
