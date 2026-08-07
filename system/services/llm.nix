# Local LLM inference — llama.cpp
# llama.cpp : CPU/GPU inference, supports GGUF models
{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    llama-cpp  # GGUF inference CLI + server (llama-server --port 8080)
    oterm      # TUI for LLM interaction
  ];

  # Open-WebUI — browser UI connecting to llama.cpp / vLLM servers
  services.open-webui = {
    enable = true;
    environment = {
      ANONYMIZED_TELEMETRY   = "False";
      DO_NOT_TRACK           = "True";
      SCARF_NO_ANALYTICS     = "True";
      # llama.cpp server (OpenAI-compatible at /v1)
      OPENAI_API_BASE_URL    = "http://127.0.0.1:8080/v1";
      OPENAI_API_KEY         = "not-needed";
    };
  };
}
