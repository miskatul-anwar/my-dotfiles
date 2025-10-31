{config, pkgs, ... }: {
  imports = [
    ./modules/git.nix
    ./modules/codium.nix
    ./modules/env.nix
    ./modules/shell.nix
    ./modules/packages.nix
    ./modules/window-manager/mod.nix
  ];

  home = {
    username = "miskat";
    homeDirectory = "/home/miskat";
    stateVersion="25.05";

    file = {};
  };


   programs.home-manager.enable = true;
}
