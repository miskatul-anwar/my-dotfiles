{config, pkgs, ...}:{
  services.docker = {
    enable = true;
    package = pkgs.docker;
  };

  environment.systemPackages = with pkgs; [ docker-compose ];
}
