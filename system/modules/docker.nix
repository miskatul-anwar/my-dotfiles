{config, pkgs, ...}:{
  virtualisation.docker = {
    enable = true;
    package = pkgs.docker;
  };

  environment.systemPackages = with pkgs; [ docker-compose ];

  # systemd.services.jupyter-notebok-docker = {
  #   description = "Jupyter NoteBook Docker Cotainer";
  #   after = ["network.target" "docker.service"];
  #   wants = ["docker.service"];

  #   serviceConfig = {
  #     Type = "simple";
  #     Restart = "always";
  #     ExecStart = "${pkgs.docker}/bin/docker run --rm -p 8888:8888 -v /home/miskat/notebooks:/home/jovyan/work jupyter/base-notebook";
  #     User = "miskat";
  #     WorkingDirectory = "/home/miskat";
  #   };
  # };
}
