# Base System Core Configuration
{ ... }:
{
  imports = [
    # Hardware
    ../hardware/hardware-configuration.nix
    ../hardware/drives.nix
    ../hardware/nvidia.nix

    # Core system settings
    ../core/bootloader.nix
    ../core/locale.nix
    ../core/networking.nix
    ../core/users.nix
    ../core/nix.nix

    # Audio, Video Drivers, Media Codecs & QoL Services
    ../desktop/audio.nix
    ../desktop/fonts.nix
    ../desktop/media-drivers.nix

    # System packages (CLI, Dev, Python AI/ML, Security, Common Apps)
    ../packages/cli.nix
    ../packages/development.nix
    ../packages/python-ai.nix
    ../packages/security.nix
    ../packages/apps.nix

    # Services
    ../services/virtualisation.nix
    ../services/docker.nix
    ../services/unsloth.nix
    ../services/flatpak.nix
    ../services/llm.nix
  ];

  # Cloudflare WARP VPN service & CLI (warp-cli) — Disabled for now (set to true to enable)
  services.cloudflare-warp.enable = false;

  # nix-ld — dynamic linker for unpatched prebuilt binaries (standalone Python, uv, VSCode server, unsloth wheels)
  programs.nix-ld.enable = true;

  # envfs — FHS compatibility layer creating dynamic symlinks for /bin, /usr/bin shebangs (Unsloth Studio, standard Linux scripts)
  services.envfs.enable = true;

  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.permittedInsecurePackages = [
    "electron-40.10.5"
  ];

  system.stateVersion = "26.05";
}
