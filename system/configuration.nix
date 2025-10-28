{config, pkgs, ...}:
{
imports = [
./hardware/hardware-configuration.nix
./modules/default-apps.nix
./modules/fonts.nix
./modules/bootloader.nix
./modules/networking.nix
./modules/locale.nix
./modules/users.nix
./modules/xserver.nix
./modules/desktop.nix
./modules/printing.nix
./modules/sound.nix
./modules/packages.nix
./modules/git.nix
./modules/hyprland.nix
./modules/vscode.nix
# ./modules/nvidia.nix
# ./modules/nvidia-prime.nix
];

# Allow unfree packages
nixpkgs.config.allowUnfree = true;

# Enable flakes
nix.settings.experimental-features = ["nix-command" "flakes"];

system.stateVersion = "25.05";

}
