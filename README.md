# ❄️ Miskat's NixOS Dotfiles: GNOME 47 + Ghostty Profile

[![NixOS](https://img.shields.io/badge/NixOS-unstable-blue.svg?style=for-the-badge&logo=nixos&logoColor=white)](https://nixos.org)
[![Home Manager](https://img.shields.io/badge/Home_Manager-master-red.svg?style=for-the-badge&logo=nixos&logoColor=white)](https://nix-community.github.io/home-manager/)
[![GNOME](https://img.shields.io/badge/GNOME-47_Desktop-4A86E8?style=for-the-badge&logo=gnome&logoColor=white)](https://www.gnome.org)
[![Ghostty](https://img.shields.io/badge/Terminal-Ghostty-black.svg?style=for-the-badge)](https://ghostty.org)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg?style=for-the-badge)](https://opensource.org/licenses/MIT)

A clean, reproducible, single-target flake-based NixOS and Home Manager environment featuring **GNOME 47 Desktop Environment**, official **Adwaita Dark Theme/Icons/Cursors**, **Ghostty Terminal**, **Nixvim Neovim setup**, **Python AI/ML/DL suite**, and **Encrypted DNS over TLS + TCP BBR Network Security**.

---

## 🏛️ Repository Architecture

```text
my-dotfiles/
├── flake.nix                 # Flake entry point (Single target: nixosConfigurations.miskat)
├── flake.lock                # Locked dependency tree
├── system/                   # System-level NixOS configuration
│   ├── profiles/             # Host profile (default.nix, common.nix)
│   ├── core/                 # Core system services (bootloader, networking, users, nix)
│   ├── desktop/              # GNOME 47 DE (Adwaita), Ghostty, Audio, Fonts, Media drivers
│   ├── hardware/             # Hardware configuration, graphics, kernel parameters
│   ├── packages/             # CLI utilities, dev tools, security, apps, python-ai
│   └── services/             # Docker, DBMS, LLM, Flatpak, Virtualisation
└── home/                     # Declarative User Environment (Home Manager)
    └── miskat/
        ├── profiles/         # User profile (Adwaita cursor/icons/theme)
        ├── home.nix          # HM root entry point
        └── modules/
            ├── shell/        # Zsh, Starship, environment variables
            ├── terminal/     # Ghostty Terminal configuration
            ├── editor/       # Nixvim Neovim & VSCodium settings/snippets
            └── desktop/      # GNOME wallpaper configuration
```

---

## 🛡️ Network Security & Speed Stack

- **Stateful Firewall**: Stealth mode with restricted TCP ports (`22`, `80`, `443`), anti-spoofing reverse path filtering, and dropped unroutable ICMP sweeps.
- **TCP BBR & Fast Open**: Enabled in Linux kernel sysctls for zero-latency network throughput.
- **Encrypted DNS over TLS**: Direct Cloudflare (`1.1.1.1`) and Quad9 (`9.9.9.9`) encrypted resolver with DNSSEC validation via `systemd-resolved`.

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

---

## 📜 License
This repository is open source under the [MIT License](LICENSE).
