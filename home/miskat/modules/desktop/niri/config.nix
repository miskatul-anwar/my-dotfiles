# Niri Compositor Configuration & Ergonomic Scrollable-Tiling Keybindings
{ config, pkgs, ... }:
let
  actions = config.lib.niri.actions;
in
{
  programs.niri = {
    package = pkgs.niri;

    settings = {
      # ── Input Settings ──────────────────────────────────────────────
      input = {
        keyboard = {
          xkb = {
            layout = "us";
          };
        };
        touchpad = {
          tap = true;
          natural-scroll = true;
          dwt = true;
        };
        mouse = {
          natural-scroll = false;
        };
      };

      # ── Outputs ─────────────────────────────────────────────────────
      outputs = {
        "*" = {
          mode = {
            width = 1920;
            height = 1080;
            refresh = 60.0;
          };
          scale = 1.0;
        };
      };

      # ── Layout & Aesthetics ─────────────────────────────────────────
      layout = {
        gaps = 8;
        center-focused-column = "on-overflow";

        preset-column-widths = [
          { proportion = 0.33333; }
          { proportion = 0.5; }
          { proportion = 0.66667; }
        ];

        default-column-width = { proportion = 0.5; };

        focus-ring = {
          enable = true;
          width = 2;
          active = { color = "#cba6f7"; };
          inactive = { color = "#313244"; };
        };

        border = {
          enable = false;
        };

        shadow = {
          enable = false;
        };
      };

      # ── Startup Environment & Autostart Daemons ─────────────────────
      spawn-at-startup = [
        { command = [ "dbus-update-activation-environment" "--systemd" "DISPLAY" "WAYLAND_DISPLAY" "XDG_CURRENT_DESKTOP" ]; }
        { command = [ "dms" ]; }
        { command = [ "wl-paste" "--type" "text" "--watch" "cliphist" "store" ]; }
        { command = [ "wl-paste" "--type" "image" "--watch" "cliphist" "store" ]; }
        { command = [ "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1" ]; }
      ];

      # ── Keybindings ─────────────────────────────────────────────────
      binds = {
        # ── Launchers & Terminal ──────────────────────────────────────
        "Mod+Return".action = actions.spawn "kitty";
        "Mod+D".action      = actions.spawn "dms" "toggle-launcher";
        "Mod+E".action      = actions.spawn "nautilus";
        "Mod+Y".action      = actions.spawn "kitty" "-e" "yazi";
        "Mod+C".action      = actions.spawn "kitty" "-e" "nvim";
        "Mod+V".action      = actions.spawn "dms" "toggle-clipboard";
        "Mod+N".action      = actions.spawn "dms" "toggle-notifications";
        "Mod+W".action      = actions.spawn "google-chrome-stable";

        # ── Window Controls ───────────────────────────────────────────
        "Mod+Q".action              = actions.close-window;
        "Mod+F".action              = actions.maximize-column;
        "Mod+Shift+F".action        = actions.fullscreen-window;
        "Mod+Space".action          = actions.toggle-window-floating;
        "Mod+Shift+C".action        = actions.quit;
        "Mod+Backspace".action      = actions.spawn "dms" "toggle-power";

        # ── Focus Movement (Vim HJKL + Arrow Keys) ────────────────────
        "Mod+Left".action           = actions.focus-column-left;
        "Mod+Right".action          = actions.focus-column-right;
        "Mod+Up".action             = actions.focus-window-up;
        "Mod+Down".action           = actions.focus-window-down;
        "Mod+H".action              = actions.focus-column-left;
        "Mod+L".action              = actions.focus-column-right;
        "Mod+K".action              = actions.focus-window-up;
        "Mod+J".action              = actions.focus-window-down;

        # ── Move Window / Column ──────────────────────────────────────
        "Mod+Shift+Left".action     = actions.move-column-left;
        "Mod+Shift+Right".action    = actions.move-column-right;
        "Mod+Shift+Up".action       = actions.move-window-up;
        "Mod+Shift+Down".action     = actions.move-window-down;
        "Mod+Shift+H".action        = actions.move-column-left;
        "Mod+Shift+L".action        = actions.move-column-right;
        "Mod+Shift+K".action        = actions.move-window-up;
        "Mod+Shift+J".action        = actions.move-window-down;

        # ── Column Resizing ───────────────────────────────────────────
        "Mod+R".action              = actions.switch-preset-column-width;
        "Mod+Minus".action          = actions.set-column-width "-10%";
        "Mod+Equal".action          = actions.set-column-width "+10%";

        # ── Workspaces (1..9) ─────────────────────────────────────────
        "Mod+1".action              = actions.focus-workspace 1;
        "Mod+2".action              = actions.focus-workspace 2;
        "Mod+3".action              = actions.focus-workspace 3;
        "Mod+4".action              = actions.focus-workspace 4;
        "Mod+5".action              = actions.focus-workspace 5;
        "Mod+6".action              = actions.focus-workspace 6;
        "Mod+7".action              = actions.focus-workspace 7;
        "Mod+8".action              = actions.focus-workspace 8;
        "Mod+9".action              = actions.focus-workspace 9;

        "Mod+Shift+1".action.move-column-to-workspace = 1;
        "Mod+Shift+2".action.move-column-to-workspace = 2;
        "Mod+Shift+3".action.move-column-to-workspace = 3;
        "Mod+Shift+4".action.move-column-to-workspace = 4;
        "Mod+Shift+5".action.move-column-to-workspace = 5;
        "Mod+Shift+6".action.move-column-to-workspace = 6;
        "Mod+Shift+7".action.move-column-to-workspace = 7;
        "Mod+Shift+8".action.move-column-to-workspace = 8;
        "Mod+Shift+9".action.move-column-to-workspace = 9;

        # ── Screenshots & Hardware Keys ──────────────────────────────
        "Print".action              = actions.spawn "sh" "-c" "grim -g \"$(slurp)\" - | wl-copy";
        "Mod+Control+S".action      = actions.spawn "sh" "-c" "mkdir -p ~/Pictures/Screenshots && grim -g \"$(slurp)\" ~/Pictures/Screenshots/$(date +'%Y-%m-%d_%H-%M-%S').png";
        "Mod+Shift+S".action        = actions.spawn "sh" "-c" "grim -g \"$(slurp)\" - | wl-copy";

        "XF86AudioRaiseVolume".action = actions.spawn "pamixer" "-i" "5";
        "XF86AudioLowerVolume".action = actions.spawn "pamixer" "-d" "5";
        "XF86AudioMute".action        = actions.spawn "pamixer" "-t";
        "XF86AudioMicMute".action     = actions.spawn "pamixer" "--default-source" "-t";
        "XF86AudioPlay".action        = actions.spawn "playerctl" "play-pause";
        "XF86AudioNext".action        = actions.spawn "playerctl" "next";
        "XF86AudioPrev".action        = actions.spawn "playerctl" "previous";
        "XF86MonBrightnessUp".action  = actions.spawn "brightnessctl" "s" "+5%";
        "XF86MonBrightnessDown".action = actions.spawn "brightnessctl" "s" "5%-";
      };
    };
  };
}
