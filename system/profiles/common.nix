# Shared System Core Configuration — Inherited by both GNOME & Hyprland profiles
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

    # Audio & Fonts
    ../desktop/audio.nix
    ../desktop/fonts.nix

    # System packages (CLI, Dev, Python AI/ML, Security, Common Apps)
    ../packages/cli.nix
    ../packages/development.nix
    ../packages/python-ai.nix
    ../packages/security.nix
    ../packages/apps.nix

    # Services
    ../services/virtualisation.nix
    ../services/flatpak.nix
    ../services/llm.nix
  ];

  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.permittedInsecurePackages = [
    "electron-40.10.5"
  ];

  system.stateVersion = "26.05";
}
