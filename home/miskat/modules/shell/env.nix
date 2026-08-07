{ pkgs, ... }:
{
  home.sessionVariables = {
    # ── Core ─────────────────────────────────────────────────────────
    EDITOR   = "nvim";
    SHELL    = "${pkgs.zsh}/bin/zsh";
    LANG     = "en_US.UTF-8";
    FLAKE    = "/home/miskat/my-dotfiles";

    # ── AI / LLM Tooling ─────────────────────────────────────────────
    # Token loaded locally from ~/.hf_token to avoid GitHub Secret Protection block
    ANTHROPIC_BASE_URL                         = "https://agentrouter.org";
    ANTHROPIC_MODEL                            = "claude-opus-5";
    CLAUDE_CODE_ENABLE_GATEWAY_MODEL_DISCOVERY = "1";
    OLLAMA_NUM_PARALLEL                        = "4";

    # ── Python / uv Tooling ──────────────────────────────────────────
    UV_PYTHON_DOWNLOADS                        = "never";        # Never fetch standalone builds
    UV_PYTHON_PREFERENCE                       = "only-system";  # Only use Python found on PATH

    # ── Browser default ───────────────────────────────────────────────
    BROWSER  = "google-chrome";

    # ── NVIDIA Wayland & Chromium Ozone Fixes ────────────────────────
    NIXOS_OZONE_WL           = "1";        # Forces Chrome, Electron & Zen Browser to native Wayland mode
    GBM_BACKEND              = "nvidia-drm";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    __GL_VRR_ALLOWED         = "0";        # Disable VRR/G-Sync micro-flickering on video hover
    WLR_NO_HARDWARE_CURSORS  = "1";        # Software cursor overlay to prevent hardware cursor jitter
    WLR_RENDERER_ALLOW_SOFTWARE = "1";
    CLUTTER_BACKEND          = "wayland";
    XDG_SESSION_TYPE         = "wayland";
  };
}
