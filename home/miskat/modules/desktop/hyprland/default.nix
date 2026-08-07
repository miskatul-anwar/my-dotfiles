# Hyprland window manager — modular architecture entry point
{ ... }:
{
  imports = [
    ./binds.nix
    # ./rules.nix
    ./hyprlock.nix
    ./hypridle.nix
    ./hyprpaper.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;
    configType = "hyprlang";

    settings = {
      # ── Monitor ──────────────────────────────────────────────────────
      monitor = ",1920x1080@60,auto,1.25";

      # ── Startup Services ─────────────────────────────────────────────
      exec = [
        "systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
        "dbus-update-activation-environment --systemd DISPLAY WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
      ];

      exec-once = [
        "dunst"
        "waybar"
        "wl-paste --type text --watch cliphist store"
        "wl-paste --type image --watch cliphist store"
        "awww-daemon"
        "set-wallpaper"
        "hypridle"
        "hyprctl setcursor Bibata-Modern-Classic 24"
      ];

      # ── Debug ─────────────────────────────────────────────────────────
      debug = {
        disable_logs = false;
      };

      # ── Variables ─────────────────────────────────────────────────────
      "$mainMod" = "SUPER";
      "$term"    = "kitty";
      "$editor"  = "nvim";
      "$file"    = "nautilus";
      "$browser" = "google-chrome";

      # ── Environment Variables ─────────────────────────────────────────
      env = [
        "XCURSOR_THEME,Bibata-Modern-Classic"
        "XCURSOR_SIZE,24"
        "HYPRCURSOR_THEME,Bibata-Modern-Classic"
        "HYPRCURSOR_SIZE,24"
      ];

      # ── Input & Touchpad ───────────────────────────────────────────────
      input = {
        kb_layout                      = "us";
        follow_mouse                   = 1;
        sensitivity                    = 0;
        "touchpad:natural_scroll"       = true;
        "touchpad:disable_while_typing" = true;
        "touchpad:tap-to-click"         = true;
      };

      # ── General (ZaneyOS Catppuccin Active Borders) ────────────────────
      general = {
        gaps_in              = 6;
        gaps_out             = 14;
        border_size          = 2;
        "col.active_border"  = "rgba(cba6f7ee) rgba(89b4faee) 45deg";
        "col.inactive_border" = "rgba(313244aa)";
        layout               = "dwindle";
      };

      # ── Decoration (Blur enabled, Shadows disabled) ───────────────────
      decoration = {
        rounding                 = 12;
        drop_shadow              = false;

        blur = {
          enabled           = true;
          size              = 8;
          passes            = 3;
          new_optimizations = true;
          ignore_opacity    = true;
          xray              = false;
        };
      };

      # ── Layer Rules (Blur & Ignorezero for Dunst, Waybar, Rofi) ─────────
      layerrule = [
        "blur,dunst"
        "ignorezero,dunst"
        "blur,waybar"
        "ignorezero,waybar"
        "blur,rofi"
        "ignorezero,rofi"
      ];

      # ── Animations ────────────────────────────────────────────────────
      animations = {
        enabled = true;
        bezier = "ease,0.4,0.02,0.21,1";
        animation = [
          "windows,    1, 3.5, ease, slide"
          "windowsOut, 1, 3.5, ease, slide"
          "border,     1, 6,   default"
          "fade,       1, 3,   ease"
          "workspaces, 1, 3.5, ease"
        ];
      };

      # ── Layouts ───────────────────────────────────────────────────────
      dwindle = {
        preserve_split = true;
      };
    };
  };
}
