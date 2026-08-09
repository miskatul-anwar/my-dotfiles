# Local LLM inference — Ollama + Open-WebUI
{ pkgs, ... }:
{
  # Ollama Service — local model runner with CUDA GPU acceleration
  services.ollama = {
    enable = true;
    package = pkgs.ollama-cuda;
  };

  environment.systemPackages = with pkgs; [
    ollama-cuda # Ollama CLI client with CUDA support
    oterm       # Terminal TUI for Ollama interaction
  ];

  # Open-WebUI — browser UI connecting to Ollama
  services.open-webui = {
    enable = true;
    environment = {
      ANONYMIZED_TELEMETRY = "False";
      DO_NOT_TRACK          = "True";
      SCARF_NO_ANALYTICS    = "True";
      OLLAMA_BASE_URL      = "http://127.0.0.1:11434";
    };
  };
}
