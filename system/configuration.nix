{config, pkgs, ...}:
{
imports = [
./hardware/hardware-configuration.nix
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
./modules/printing.nix
./modules/sound.nix
./modules/packages.nix
./modules/git.nix
./modules/codium.nix
];

# Allow unfree packages
nixpkgs.config.allowUnfree = true;

# Enable flakes
nix.settings.experimental-features = ["nix-command" "flakes"];

# Enable Auto Upgrades
system.autoUpgrade.enable = true;
system.autoUpgrade.allowReboot = true;

system.stateVersion = "25.05";

}
