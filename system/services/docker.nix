# Docker & Distrobox Container Environment
{ pkgs, ... }:
{
  virtualisation.docker = {
    enable = true;
    package = pkgs.docker;
    autoPrune = {
      enable = true;
      dates = "weekly";
    };
  };

  environment.systemPackages = with pkgs; [
    distrobox
    docker-compose
  ];
}
