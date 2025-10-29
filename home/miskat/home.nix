{config, pkgs, ... }: {
  imports = [
    ./modules/git.nix
    ./modules/files.nix
    ./modules/env.nix
    ./modules/shell.nix
    ./modules/packages.nix
  ];

  home = {
    username = "miskat";
    homeDirectory = "/home/miskat";
    stateVersion="25.05";

    file = {};
  };


   programs.home-manager.enable = true;
}
