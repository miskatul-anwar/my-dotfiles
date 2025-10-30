{ config, pkgs, ... }:

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

  # Ensure host notebook directory is writable by container user (jovyan:1000)
  systemd.services.fix-notebook-permissions = {
    description = "Ensure /home/miskat/notebooks is owned by container user";
    serviceConfig = {
      Type = "oneshot";
      ExecStart = "${pkgs.coreutils}/bin/chown -R 1000:100 /home/miskat/notebooks";
    };
    # Run before Jupyter starts
    before = [ "jupyter-notebook-docker.service" ];
    wantedBy = [ "multi-user.target" ];
  };

  # Auto-pull latest Jupyter image on boot and daily
  systemd.services.docker-pull-jupyter = {
    description = "Pull latest Jupyter Notebook image";
    after = [ "network-online.target" "docker.service" ];
    wants = [ "network-online.target" "docker.service" ];
    serviceConfig = {
      Type = "oneshot";
      ExecStart = "${pkgs.docker}/bin/docker pull jupyter/base-notebook";
      User = "root";
    };
    wantedBy = [ "multi-user.target" ];
  };

  systemd.timers.docker-pull-jupyter = {
    wantedBy = [ "timers.target" ];
    timerConfig = {
      OnCalendar = "daily";
      Persistent = true;
    };
  };

  # Persistent Jupyter Notebook Docker Service
  systemd.services.jupyter-notebook-docker = {
    description = "Persistent Jupyter Notebook Docker Container";
    after = [ "network-online.target" "docker.service" "fix-notebook-permissions.service" "docker-pull-jupyter.service" ];
    wants = [ "network-online.target" "docker.service" "docker-pull-jupyter.service" ];
    serviceConfig = {
      Type = "simple";
      Restart = "always";
      RestartSec = 5;
      ExecStartPre = ["${pkgs.docker}/bin/docker rm -f jupyter-notebook || true"
                      "${pkgs.docker}/bin/docker pull jupyter/base-notebook"];
      ExecStart = "${pkgs.docker}/bin/docker run --name jupyter-notebook -p 8888:8888 -v /home/miskat/notebooks:/home/jovyan/work jupyter/base-notebook start-notebook.sh --NotebookApp.token=''";
      ExecStop = "${pkgs.docker}/bin/docker stop jupyter-notebook";
      User = "root";
      WorkingDirectory = "/home/miskat";
    };
    wantedBy = [ "multi-user.target" ];
  };
}
