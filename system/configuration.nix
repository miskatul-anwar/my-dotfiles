{config, pkgs, ...}:
{
imports = [
./modules/window-manager.nix
./hardware/hardware-configuration.nix
./modules/nvidia.nix
./modules/gc.nix
./modules/auto-upgrade.nix
./modules/ascii.nix
./hardware/drives.nix
./modules/nh.nix
./modules/dbms.nix
./modules/docker.nix
./modules/default-apps.nix
./modules/fonts.nix
./modules/bootloader.nix
./modules/networking.nix
./modules/locale.nix
./modules/users.nix
./modules/desktop.nix
./modules/sound.nix
./modules/packages.nix
./modules/git.nix
./modules/codium.nix
];

# Allow unfree packages
nixpkgs.config.allowUnfree = true;

# Enable flakes
nix.settings.experimental-features = ["nix-command" "flakes"];

system.stateVersion = "25.05";

}
