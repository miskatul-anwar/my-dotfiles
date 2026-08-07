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
    ANTHROPIC_BASE_URL                      = "https://agentrouter.org";
    ANTHROPIC_MODEL                         = "claude-opus-5";
    CLAUDE_CODE_ENABLE_GATEWAY_MODEL_DISCOVERY = "1";
    OLLAMA_NUM_PARALLEL                     = "4";

    # ── Theme & Styling ──────────────────────────────────────────────
    GTK_THEME            = "adw-gtk3-dark";
    QT_STYLE_OVERRIDE    = "adwaita-dark";

    # ── Browser & terminal defaults ───────────────────────────────────
    BROWSER  = "google-chrome";
    TERMINAL = "kitty";

    # ── NVIDIA Wayland ────────────────────────────────────────────────
    GBM_BACKEND              = "nvidia-drm";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    LIBVA_DRIVER_NAME        = "nvidia";
    __GL_VRR_ALLOWED         = "1";
    WLR_NO_HARDWARE_CURSORS  = "1";
    WLR_RENDERER_ALLOW_SOFTWARE = "1";
    CLUTTER_BACKEND          = "wayland";
    WLR_RENDERER             = "vulkan";

    # ── Wayland session ───────────────────────────────────────────────
    XDG_CURRENT_DESKTOP = "Hyprland";
    XDG_SESSION_DESKTOP = "Hyprland";
    XDG_SESSION_TYPE    = "wayland";
  };
}
