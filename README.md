# ❄️ my-dotfiles

A modular, reproducible, flake-based NixOS & Home Manager dotfiles repository styled with the **Catppuccin Mocha** palette and **ZaneyOS** Wayland desktop aesthetic.

![Desktop Showcase](view.png)

---

## 🌟 Highlights & Architecture

### 🎨 Desktop & Visual Aesthetic
- **Window Manager**: Hyprland with ZaneyOS ruleset, active purple/blue glowing borders (`rgba(cba6f7ee) rgba(89b4faee) 45deg`), and window animations.
- **Status Bar**: Curved glass Waybar with asymmetric pill modules and Catppuccin Mocha accents.
- **Application Launcher**: Glassmorphic Rofi with a 2-column grid layout and high-res **Tela-circle-dark** icons.
- **Notifications**: Dunst notification daemon customized with Catppuccin Mocha Lavender borders and `JetBrainsMono Nerd Font`.
- **Terminals**: Kitty styled with `JetBrainsMono Nerd Font` and Catppuccin Mocha palette.
- **Shell & Prompt**: Zsh with **Powerlevel10k** prompt integration, Zoxide, LSD, and custom aliases.
- **System Fetch**: Modernized **Fastfetch** enclosed in a rounded box frame (`╭─────╮` ... `╰─────╯`) displaying essential system & hardware specs.
- **Wallpapers**: Local theme-matching anime wallpaper cycler (`anime-wallpaper`) running via systemd timer (or press `Super + Shift + W`).

### ⚡ Declarative Nixvim IDE (`github:nix-community/nixvim`)
- **Editor**: Declarative Neovim configured via **Nixvim** flake input.
- **Theme**: Catppuccin Mocha transparent theme.
- **LSP Support**: Auto-configured language servers for `nixd` (Nix), `clangd` (C/C++), `pyright` (Python), `rust_analyzer` (Rust), and `bashls`.
- **Completion & Snippets**: `nvim-cmp` + `luasnip` with Tab completion.
- **Navigation & Explorer**: `telescope` (fuzzy finder) and `nvim-tree` file explorer (`Ctrl + N`).
- **Git & Formatting**: `gitsigns`, `comment-nvim`, `vim-surround`, `lualine`, `bufferline`, and `which-key`.

---

## 📁 Repository Layout

```
my-dotfiles/
├── flake.nix                 # Flake entry point (miskat-hyprland & miskat-gnome profiles)
├── system/                   # System-level NixOS modules
│   ├── profiles/             # System profiles (hyprland.nix, gnome.nix, common.nix)
│   ├── core/                 # Bootloader, locale, networking, users, nix options
│   ├── desktop/              # GNOME DE, Hyprland suite, Pipewire audio, fonts
│   ├── hardware/             # Machine hardware configuration
│   ├── packages/             # System packages (cli, dev, security, apps)
│   └── services/             # Virtualisation, Flatpak, local LLM, Docker, MariaDB
└── home/
    └── miskat/               # User-level Home Manager modules
        ├── profiles/         # Home profiles (hyprland.nix, gnome.nix, common.nix)
        └── modules/          # Modular user configurations
            ├── git.nix       # User Git credentials
            ├── packages.nix  # User packages (Zen Browser)
            ├── shell/        # Zsh, environment variables, sleek Fastfetch
            ├── terminal/     # Kitty, Alacritty, Ghostty
            ├── desktop/      # Hyprland, Waybar, Rofi, SwayNC, wallpaper
            └── editor/       # Declarative Nixvim IDE configuration
```

---

## 🚀 Usage & Profiles

### Switch Profiles

- **Hyprland Profile** (Catppuccin Mocha Lavender, Tela icons, Bibata cursor, Waybar, SwayNC, Rofi):
  ```bash
  nh os switch --hostname miskat-hyprland
  # Or alias:
  rebuild-hyprland
  ```

- **GNOME Profile** (Pure GNOME DE + Stock Adwaita theme, Adwaita icons, Adwaita cursor):
  ```bash
  nh os switch --hostname miskat-gnome
  # Or alias:
  rebuild-gnome
  ```

### Essential Shortcuts

| Shortcut | Action |
| :--- | :--- |
| `Super + Return` | Open Kitty Terminal |
| `Super + D` | Open Rofi Launcher |
| `Super + W` | Open Google Chrome |
| `Super + Shift + W` | Cycle Anime Wallpaper |
| `Super + S` | Capture Region Screenshot |
| `Print` or `Super + Shift + S` | Capture Region to Clipboard |
| `Super + L` | Lock Screen (`hyprlock`) |
| `Super + Backspace` | Open Power Menu (`wlogout`) |
| `Ctrl + N` | Toggle Nvim-Tree in Neovim |

---

## 🔐 Credentials & Rate Limits

- **GitHub API Rate Limit**: Configured `nix.extraOptions = "!include /home/miskat/.config/nix/nix.conf"` to load personal access tokens locally without committing secrets into Git.
- **HuggingFace API Token**: Stored locally in `~/.hf_token` and auto-exported in Zsh environment.
