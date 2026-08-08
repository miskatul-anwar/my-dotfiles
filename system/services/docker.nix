# Docker daemon & container configuration
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

  environment.systemPackages = with pkgs; [ docker-compose ];
}
