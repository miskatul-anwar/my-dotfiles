# Declarative Unsloth Studio Docker Container Service
{ pkgs, ... }:
{
  virtualisation.oci-containers = {
    backend = "docker";
    containers.unsloth-studio = {
      image = "unsloth/unsloth:latest";
      autoStart = false; # Set to true to start on boot, or false for on-demand via systemctl / unsloth-start
      ports = [
        "8000:8000"  # Jupyter Lab Web Interface -> http://localhost:8000
        "2222:22"    # Container SSH Access -> ssh -p 2222 unsloth@localhost
      ];
      environment = {
        JUPYTER_PORT = "8000";
        JUPYTER_PASSWORD = "unsloth";
        USER_PASSWORD = "unsloth2024";
      };
      volumes = [
        "/home/miskat/unsloth-workspace:/workspace"
        "/home/miskat/.cache/huggingface:/root/.cache/huggingface"
      ];
      extraOptions = [
        "--gpus=all"
        "--ipc=host"
      ];
    };
  };
}
