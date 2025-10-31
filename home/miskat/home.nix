{config, pkgs, ... }: {
  imports = [
    ./modules/git.nix
    ./modules/env.nix
    ./modules/shell.nix
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
