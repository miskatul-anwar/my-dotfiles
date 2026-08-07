{ ... }:
{
  imports = [
    # Hardware
    ./hardware/hardware-configuration.nix
    ./hardware/drives.nix
    ./hardware/nvidia.nix

    # Core system
    ./core/bootloader.nix
    ./core/locale.nix
    ./core/networking.nix
    ./core/users.nix
    ./core/nix.nix

    # Desktop / display
    ./desktop/gnome.nix
    ./desktop/audio.nix
    ./desktop/fonts.nix
    ./desktop/window-manager.nix

    # System packages (grouped by purpose)
    ./packages/cli.nix
    ./packages/development.nix
    ./packages/security.nix
    ./packages/apps.nix

    # Optional services (uncomment to enable)
    ./services/virtualisation.nix
    ./services/flatpak.nix
    ./services/llm.nix
    # ./services/docker.nix
    # ./services/dbms.nix
    # ./services/android-dev.nix
  ];

  # Allow unfree + specific insecure packages
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.permittedInsecurePackages = [
    "electron-40.10.5"
  ];

  system.stateVersion = "26.05";
}
