{config, pkgs, ... }: {
  imports = [
    ./modules/ghostty.nix
    ./modules/git.nix
    ./modules/env.nix
    ./modules/zsh.nix
    ./modules/packages.nix
    ./modules/codium/settings.nix
    ./modules/codium/snippet.nix
  ];

  home = {
    username = "miskat";
    homeDirectory = "/home/miskat";
    stateVersion="25.05";

    file = {};
  };


   programs.home-manager.enable = true;
}
