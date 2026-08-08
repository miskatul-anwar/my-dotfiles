# ❄️ Miskat's NixOS Dotfiles: GNOME 47 + Ghostty Profile

[![NixOS](https://img.shields.io/badge/NixOS-unstable-blue.svg?style=for-the-badge&logo=nixos&logoColor=white)](https://nixos.org)
[![Home Manager](https://img.shields.io/badge/Home_Manager-master-red.svg?style=for-the-badge&logo=nixos&logoColor=white)](https://nix-community.github.io/home-manager/)
[![GNOME](https://img.shields.io/badge/GNOME-47_Desktop-4A86E8?style=for-the-badge&logo=gnome&logoColor=white)](https://www.gnome.org)
[![Ghostty](https://img.shields.io/badge/Terminal-Ghostty-black.svg?style=for-the-badge)](https://ghostty.org)
[![Distrobox](https://img.shields.io/badge/Container-Distrobox-purple.svg?style=for-the-badge)](https://distrobox.privatedns.org)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg?style=for-the-badge)](https://opensource.org/licenses/MIT)

A clean, reproducible, single-target flake-based NixOS and Home Manager environment featuring **GNOME 47 Desktop Environment**, official **Adwaita Dark Theme/Icons/Cursors**, **GNOME Shell Extensions** (`dash-to-panel`, `user-themes`, `dash-to-dock`, `rounded-window-corners`, `blur-my-shell`, `caffeine`), **Ghostty Terminal**, **Distrobox + Docker**, **Nixvim Neovim setup**, **Python AI/ML/DL suite**, and **Encrypted DNS over TLS + TCP BBR Network Security**.

---

## 🏛️ Repository Architecture

```text
my-dotfiles/
├── flake.nix                 # Flake entry point (Single target: nixosConfigurations.miskat)
├── flake.lock                # Locked dependency tree
├── system/                   # System-level NixOS configuration
│   ├── profiles/             # Host profile (default.nix, common.nix)
│   ├── core/                 # Core system services (bootloader, networking, users, nix)
│   ├── desktop/              # GNOME 47 DE (Adwaita & Extensions), Ghostty, Audio, Fonts
│   ├── hardware/             # Hardware configuration, NVIDIA graphics, kernel sysctls
│   ├── packages/             # CLI utilities, dev tools, security, apps, python-ai
│   └── services/             # Docker, Distrobox, DBMS, LLM, Flatpak, Virtualisation
└── home/                     # Declarative User Environment (Home Manager)
    └── miskat/
        ├── profiles/         # User profile (Adwaita cursor/icons/theme, dconf extensions)
        ├── home.nix          # HM root entry point
        └── modules/
            ├── shell/        # Zsh, Starship, Fastfetch (built-in ASCII logo), env vars
            ├── terminal/     # Ghostty Terminal configuration
            ├── editor/       # Nixvim Neovim & VSCodium settings/snippets
            └── desktop/      # GNOME wallpaper configuration
```

---

## 🧩 GNOME Extensions & Styling

- **Theme & Icons**: Official **Adwaita Dark** theme, **Adwaita Icons**, and **Adwaita Cursors**.
- **Extensions**:
  - `dash-to-panel`: Combines the top bar and taskbar into a single unified panel.
  - `user-themes`: Custom GNOME shell theme loading.
  - `dash-to-dock`: Customizable dock layout and auto-hide behavior.
  - `rounded-window-corners-reborn`: Smooth window geometry corner radius.
  - `blur-my-shell`: Glassmorphic background blur for panels and menus.
  - `caffeine`: Prevents screen sleep during long builds or media playback.

---

## 📦 Containerization & Distrobox

- **Distrobox**: Launch any Linux distribution (Ubuntu, Arch, Fedora, Alpine, Debian) seamlessly inside Ghostty terminal with full home directory access, X11/Wayland GUI forwarding, and device access.
- **Docker & Docker Compose**: Automated container daemon pruning and development container support.

---

## 🛡️ Network Security & Speed Stack

- **Stateful Stealth Firewall**: Ping ICMP response disabled, restricted TCP ports (`22`, `80`, `443`), anti-spoofing reverse path filtering, and dropped unroutable sweeps.
- **TCP BBR & Fast Open**: Kernel sysctl tuning (`fq` queue, `bbr` congestion control, `tcp_fastopen = 3`, `tcp_syncookies = 1`).
- **Encrypted DNS over TLS**: Cloudflare (`1.1.1.1`) and Quad9 (`9.9.9.9`) encrypted resolver with DNSSEC validation via `systemd-resolved`.

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
