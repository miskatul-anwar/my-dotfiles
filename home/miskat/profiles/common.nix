# Base User Profile Configuration
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
    sessionPath   = [
      "$HOME/.npm-global/bin"
      "$HOME/.local/bin"
    ];
    file          = {};
  };

  programs.home-manager.enable = true;
}
