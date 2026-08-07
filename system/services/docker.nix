# Docker — disabled by default, uncomment in system/default.nix to enable
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
