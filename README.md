# ❄️ Miskat's NixOS Dotfiles: Niri + Dank Material Shell Profile

[![NixOS](https://img.shields.io/badge/NixOS-unstable-blue.svg?style=for-the-badge&logo=nixos&logoColor=white)](https://nixos.org)
[![Home Manager](https://img.shields.io/badge/Home_Manager-master-red.svg?style=for-the-badge&logo=nixos&logoColor=white)](https://nix-community.github.io/home-manager/)
[![Niri](https://img.shields.io/badge/Niri-Wayland_Scrollable_Tiling-cba6f7?style=for-the-badge&logo=wayland&logoColor=white)](https://github.com/YaLTeR/niri)
[![Dank Material Shell](https://img.shields.io/badge/Dank_Material_Shell-Material_3-89b4fa?style=for-the-badge&logo=gnome&logoColor=white)](https://github.com/AvengeMedia/DankMaterialShell)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg?style=for-the-badge)](https://opensource.org/licenses/MIT)

A modular, reproducible, single-target flake-based NixOS and Home Manager environment featuring **Niri (scrollable-tiling Wayland compositor)**, **Dank Material Shell (DMS)**, a **Nixvim Neovim setup**, **Unsloth Studio Docker containerization**, and a **Python AI/ML/DL suite**.

---

## 🏛️ Repository Architecture

```text
my-dotfiles/
├── flake.nix                 # Flake entry point (Single target: nixosConfigurations.miskat)
├── flake.lock                # Locked dependency tree
├── system/                   # System-level NixOS configuration
│   ├── profiles/             # Host profile (default.nix, common.nix)
│   ├── core/                 # Core system services (bootloader, networking, users, nix)
│   ├── desktop/              # Niri scrollable compositor, audio, fonts, media drivers
│   ├── hardware/             # Hardware configuration, graphics, kernel parameters
│   ├── packages/             # CLI utilities, dev tools, security, apps, python-ai
│   └── services/             # Docker (Unsloth Studio), DBMS, LLM, Flatpak, Virtualisation
└── home/                     # Declarative User Environment (Home Manager)
    └── miskat/
        ├── profiles/         # User profile (default.nix, common.nix)
        ├── home.nix          # HM root entry point
        └── modules/
            ├── shell/        # Zsh, Starship, environment variables
            ├── terminal/     # Kitty, Alacritty, Ghostty
            ├── editor/       # Nixvim Neovim & VSCodium settings/snippets
            └── desktop/      # Niri scrollable tiling & Dank Material Shell configuration
```

---

## 🖥️ Desktop Features & Keybindings

- **Compositor**: Niri (infinite scrollable tiling with 8px gaps and Catppuccin Lavender active focus rings).
- **Desktop Shell**: **Dank Material Shell (DMS)** — Material 3 unified panel, application launcher, notifications, quick settings, and power menu.

| Keybinding | Action |
| :--- | :--- |
| `Super + Return` | Open Terminal (Kitty) |
| `Super + D` | Toggle Application Launcher (DMS) |
| `Super + E` | Open File Manager (Nautilus) |
| `Super + Y` | Open TUI File Manager (Yazi in Kitty) |
| `Super + C` | Open Editor (Neovim in Kitty) |
| `Super + V` | Toggle Clipboard History (DMS) |
| `Super + N` | Toggle Notification Center (DMS) |
| `Super + Q` | Close Active Window |
| `Super + F` | Maximize Column |
| `Super + Shift + F` | Fullscreen Window |
| `Super + H/J/K/L` | Focus Left / Down / Up / Right |
| `Super + Shift + H/J/K/L` | Move Column Left / Down / Up / Right |
| `Super + 1..9` | Switch to Workspace 1..9 |
| `Super + Shift + 1..9` | Move Column to Workspace 1..9 |
| `Super + Backspace` | Open Power Menu (DMS) |

---

## 🚀 Quick Start & System Commands

### Rebuild System & User Profile
```bash
nh os switch
```
or using aliases:
```bash
update      # Rebuild and switch NixOS configuration
rebuild     # Rebuild and switch NixOS configuration
hm          # Switch Home Manager configuration
```

### Unsloth Studio Control Aliases
```bash
unsloth-on   # Start Unsloth Studio Docker service
unsloth-off  # Stop Unsloth Studio Docker service
unsloth-stat # Check Unsloth Studio status
unsloth-logs # Follow Unsloth Studio container logs
```

---

## 📜 License
This repository is open source under the [MIT License](LICENSE).
