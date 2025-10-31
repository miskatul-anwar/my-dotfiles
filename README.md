# my-dotfiles

This repository provides a modular, flake-based configuration for NixOS and Home Manager, tailored for reproducible system and user environments.

---

## Features

### NixOS Configuration
- **Modular Structure**: System settings are split into modules for hardware, drives, locale, networking, bootloader, sound, printing, users, packages, and desktop.
- **Unfree Packages**: Enabled via `nixpkgs.config.allowUnfree`.
- **Automatic System Upgrades**: Enabled with reboot support.
- **Flake Support**: Experimental features (`nix-command`, `flakes`) are activated.

### Home Manager Integration
- **Home Manager**: Managed via flakes and integrated into the system configuration.
- **User Packages**: Includes a curated selection of user-level packages and window managers.
- **Dotfiles**: Customizes git, shell aliases, VSCodium settings, and editor configurations.

### Nixpkgs & Flake Inputs
- Uses the latest `nixos-unstable` channel:
  - `nixpkgs`: Core package set.
  - `home-manager`: Follows the same nixpkgs version.
  - `zen-browser`: External package via flake input.

### NH (Nix Helper)
- **nh**: Installed and configured for system cleaning and flake management.
- **Tools**: Includes `nix-output-monitor` and `nvd` for system insights.

### Software & Services
- **System Packages**: Programming languages (Rust, Python, GCC, Clang), developer tools (Ripgrep, Vim, LunarVim, DBeaver), browsers (Google Chrome, Zen Browser), and utilities.
- **Database**: MySQL service (MariaDB) with pre-configured users and databases.
- **Editors**: VSCodium with extensions for Nix, Clang, Vim, Rust, Python, themes, and icons.
- **Shell**: Zsh with Powerlevel10k prompt, custom aliases, and initialization.
- **Window Manager**: Hyprland, Kitty, Alacritty, and essential Wayland utilities.

### Hardware & Sound
- **Hardware Configuration**: Auto-generated for Intel CPUs and custom drives.
- **Sound**: PipeWire and JACK enabled; PulseAudio disabled for modern audio routing.

---

## Structure

```
.
├── flake.nix
├── system/
│   ├── configuration.nix
│   ├── hardware/
│   └── modules/
├── home/
│   └── miskat/
│       ├── home.nix
│       └── modules/
```

---

## Usage

Clone the repository and apply configurations using Nix Helper:
```sh
nh os switch --hostname='miskat'
```
NH commands for maintenance:

```sh
nh clean
nh apply
nh os
```

Alternatively, you can use the following commands
```sh
sudo nixos-rebuild switch --flake ~/nixos#$(whoami) # For full rebuild
home-manager switch --flake ~/nixos # If you only want to rebuild home packages
```

---

## Requirements

- NixOS (x86_64-linux)
- Nix with flakes enabled
- Home Manager

For details, see module files and `flake.nix`.
