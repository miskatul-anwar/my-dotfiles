# Sway Tiling Wayland Compositor — Modular Home Manager Entry Point
{ pkgs, ... }:
{
  imports = [
    ./binds.nix
    ./rules.nix
    ./swaylock.nix
    ./swayidle.nix
  ];

  wayland.windowManager.sway = {
    enable = true;
    package = pkgs.sway;

    config = {
      modifier = "Mod4";
      terminal = "${pkgs.kitty}/bin/kitty";
      menu     = "${pkgs.rofi}/bin/rofi -show drun";

      # ── Gaps & Borders (Identical to ZaneyOS Hyprland) ───────────────
      gaps = {
        inner = 6;
        outer = 14;
        smartGaps = false;
        smartBorders = "off";
      };

      window = {
        border = 2;
        titlebar = false;
      };

      floating = {
        border = 2;
        titlebar = false;
      };

      # ── Colors (Catppuccin Mocha Lavender Palette) ───────────────────
      colors = {
        focused = {
          border      = "#cba6f7";
          background  = "#1e1e2e";
          text        = "#cdd6f4";
          indicator   = "#b4befe";
          childBorder = "#cba6f7";
        };
        focusedInactive = {
          border      = "#45475a";
          background  = "#1e1e2e";
          text        = "#a6adc8";
          indicator   = "#45475a";
          childBorder = "#45475a";
        };
        unfocused = {
          border      = "#313244";
          background  = "#1e1e2e";
          text        = "#6c7086";
          indicator   = "#313244";
          childBorder = "#313244";
        };
        urgent = {
          border      = "#f38ba8";
          background  = "#1e1e2e";
          text        = "#11111b";
          indicator   = "#f38ba8";
          childBorder = "#f38ba8";
        };
        placeholder = {
          border      = "#313244";
          background  = "#1e1e2e";
          text        = "#cdd6f4";
          indicator   = "#313244";
          childBorder = "#313244";
        };
      };

      # ── Input & Touchpad Settings ────────────────────────────────────
      input = {
        "type:touchpad" = {
          tap = "enabled";
          natural_scroll = "enabled";
          dwt = "enabled";
        };
        "type:keyboard" = {
          xkb_layout = "us";
        };
      };

      # ── Output & Display Setup ───────────────────────────────────────
      output = {
        "*" = {
          mode = "1920x1080@60Hz";
          bg   = "#1e1e2e solid_color";
        };
      };

      # ── Startup Services (Exact ZaneyOS Autostart Daemons) ───────────
      startup = [
        { command = "dbus-update-activation-environment --systemd DISPLAY WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"; }
        { command = "swaync"; }
        { command = "waybar"; }
        { command = "wl-paste --type text --watch cliphist store"; }
        { command = "wl-paste --type image --watch cliphist store"; }
        { command = "awww-daemon"; }
        { command = "set-wallpaper"; }
        { command = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1"; }
      ];

      # Disable default Sway bar since Waybar is used
      bars = [];
    };
  };
}
