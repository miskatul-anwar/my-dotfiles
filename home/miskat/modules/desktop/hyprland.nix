# Hyprland window manager — user configuration
# Keybindings inspired by prasanthrangan/hyprdots
{ pkgs, ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;
    configType = "hyprlang";

    settings = {
      # ── Monitor ──────────────────────────────────────────────────────
      monitor = ",1920x1080@60,auto,1.25";

      # ── Startup ──────────────────────────────────────────────────────
      exec = [
        "systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
        "dbus-update-activation-environment --systemd DISPLAY WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
      ];

      exec-once = [
        "dunst"
        "waybar"
        "awww-daemon"
        "anime-wallpaper"
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
      "$editor"  = "codium";
      "$file"    = "nautilus";
      "$browser" = "google-chrome-stable";

      # ── Environment Variables ─────────────────────────────────────────
      env = [
        "XCURSOR_THEME,Bibata-Modern-Classic"
        "XCURSOR_SIZE,24"
        "HYPRCURSOR_THEME,Bibata-Modern-Classic"
        "HYPRCURSOR_SIZE,24"
      ];

      # ── Input & Touchpad Gestures ──────────────────────────────────────
      input = {
        kb_layout    = "us";
        follow_mouse = 1;
        sensitivity  = 0;
        touchpad = {
          natural_scroll       = true;
          disable_while_typing = true;
          tap-to-click         = true;
        };
      };

      gestures = {
        workspace_swipe                    = true;
        workspace_swipe_fingers            = 3;
        workspace_swipe_distance           = 300;
        workspace_swipe_invert             = true;
        workspace_swipe_min_speed_to_force = 30;
        workspace_swipe_cancel_ratio       = 0.5;
      };

      # ── General (Golden Accent Borders) ───────────────────────────────
      general = {
        gaps_in              = 6;
        gaps_out             = 14;
        border_size          = 2;
        "col.active_border"  = "rgba(f3be53ee) rgba(ffd700ee) 45deg";
        "col.inactive_border" = "rgba(2a2a3baa)";
        layout               = "dwindle";
      };

      # ── Decoration (Blur enabled, No shadow) ───────────────────────────
      decoration = {
        rounding = 12;
        blur = {
          enabled           = true;
          size              = 8;
          passes            = 3;
          new_optimizations = true;
          ignore_opacity    = true;
          xray              = false;
        };
        shadow = {
          enabled = false;
        };
      };

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

      # ── Window Rules (HyprDots-style opacity + floats) ────────────────
      windowrulev2 = [
        "opacity 0.90 0.90, class:^(Google-chrome)$"
        "opacity 0.90 0.90, class:^(firefox)$"
        "opacity 0.80 0.80, class:^([Cc]odium)$"
        "opacity 0.80 0.80, class:^(kitty)$"
        "opacity 0.80 0.70, class:^(org.pulseaudio.pavucontrol)$"
        "opacity 0.80 0.70, class:^(blueman-manager)$"
        "float,  class:^(pavucontrol)$"
        "float,  class:^(blueman-manager)$"
        "float,  class:^(mpv)$"
        "center, class:^(mpv)$"
        "size 934 525, class:^(mpv)$"
        "float,  class:^(nm-connection-editor)$"
        "float,  title:^(Picture-in-Picture)$"
        "pin,    title:^(Picture-in-Picture)$"
      ];

      # ── Keybindings (HyprDots-inspired) ──────────────────────────────
      bind = [
        # Window / session actions
        "$mainMod,        Q,         killactive,"
        "$mainMod,        Delete,    exit,"
        "$mainMod,        W,         togglefloating,"
        "$mainMod,        G,         togglegroup,"
        "Alt,             Return,    fullscreen,"
        "$mainMod,        L,         exec, hyprlock"
        "$mainMod,        Backspace, exec, wlogout"
        "$mainMod+Shift,  F,         pin,"

        # Applications (HyprDots mapping)
        "$mainMod,        T,         exec, $term"
        "$mainMod,        E,         exec, $file"
        "$mainMod,        C,         exec, $editor"
        "$mainMod,        F,         exec, $browser"
        "$mainMod,        B,         exec, $browser"
        "Ctrl+Shift,      Escape,    exec, $term -e btop"
        "$mainMod,        Return,    exec, $term"

        # Rofi launchers
        "$mainMod,        A,         exec, pkill -x rofi || rofi -show drun"
        "$mainMod,        Tab,       exec, pkill -x rofi || rofi -show window"
        "$mainMod+Shift,  E,         exec, pkill -x rofi || rofi -show filebrowser"

        # Screenshot
        "$mainMod,        S,         exec, grim -g \"$(slurp)\" - | wl-copy"
        "$mainMod+Shift,  S,         exec, grim -g \"$(slurp)\""
        ",               Print,     exec, grim -g \"$(slurp)\" - | wl-copy"
        "Shift,           Print,     exec, grim -g \"$(slurp)\""

        # Waybar toggle
        "Ctrl+Alt,        W,         exec, killall waybar || waybar"

        # Color picker
        "$mainMod+Shift,  P,         exec, hyprpicker -a"

        # Focus movement
        "$mainMod,        left,      movefocus, l"
        "$mainMod,        right,     movefocus, r"
        "$mainMod,        up,        movefocus, u"
        "$mainMod,        down,      movefocus, d"

        # Workspace switch
        "$mainMod,        1,         workspace, 1"
        "$mainMod,        2,         workspace, 2"
        "$mainMod,        3,         workspace, 3"
        "$mainMod,        4,         workspace, 4"
        "$mainMod,        5,         workspace, 5"
        "$mainMod,        6,         workspace, 6"
        "$mainMod,        7,         workspace, 7"
        "$mainMod,        8,         workspace, 8"
        "$mainMod,        9,         workspace, 9"
        "$mainMod,        0,         workspace, 10"

        # Move window to workspace
        "$mainMod+Shift,  1,         movetoworkspace, 1"
        "$mainMod+Shift,  2,         movetoworkspace, 2"
        "$mainMod+Shift,  3,         movetoworkspace, 3"
        "$mainMod+Shift,  4,         movetoworkspace, 4"
        "$mainMod+Shift,  5,         movetoworkspace, 5"
        "$mainMod+Shift,  6,         movetoworkspace, 6"
        "$mainMod+Shift,  7,         movetoworkspace, 7"
        "$mainMod+Shift,  8,         movetoworkspace, 8"
        "$mainMod+Shift,  9,         movetoworkspace, 9"
        "$mainMod+Shift,  0,         movetoworkspace, 10"

        # Scroll through workspaces
        "$mainMod,        mouse_down, workspace, e+1"
        "$mainMod,        mouse_up,   workspace, e-1"

        # Scratchpad
        "$mainMod,        minus,      togglespecialworkspace, magic"
        "$mainMod+Shift,  minus,      movetoworkspace, special:magic"
      ];

      # Media keys (allow when screen locked)
      bindl = [
        ", XF86AudioMute,  exec, pamixer -t"
        ", XF86AudioPlay,  exec, playerctl play-pause"
        ", XF86AudioPause, exec, playerctl play-pause"
        ", XF86AudioNext,  exec, playerctl next"
        ", XF86AudioPrev,  exec, playerctl previous"
        ", XF86AudioMicMute, exec, pamixer --default-source -t"
      ];

      # Repeat-capable binds (brightness / volume)
      binde = [
        ", XF86AudioRaiseVolume,   exec, pamixer -i 5"
        ", XF86AudioLowerVolume,   exec, pamixer -d 5"
        ", XF86MonBrightnessUp,    exec, brightnessctl s +10%"
        ", XF86MonBrightnessDown,  exec, brightnessctl s 10%-"
      ];

      # Mouse window management
      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
        "Alt,      mouse:272, resizewindow"
      ];
    };
  };

  # ── Hyprlock — screen locker ─────────────────────────────────────────
  home.file.".config/hypr/hyprlock.conf".text = ''
    background {
      monitor =
      path = screenshot
      blur_passes = 3
      blur_size = 7
      color = rgba(1d192bee)
    }

    input-field {
      monitor =
      size = 250, 50
      outline_thickness = 2
      dots_size = 0.2
      dots_center = true
      outer_color = rgba(33ccffee)
      inner_color = rgba(1d192bee)
      font_color = rgba(c3dde7ee)
      fade_on_empty = false
      placeholder_text = <span foreground="##c3dde7">Password</span>
      check_color = rgba(00ff99ee)
      fail_color = rgba(ff5555ee)
      position = 0, -100
      halign = center
      valign = center
    }

    label {
      monitor =
      text = cmd[update:1000] echo "$(date +'%H:%M')"
      color = rgba(c3dde7ee)
      font_size = 64
      font_family = JetBrains Mono Nerd Font Bold
      position = 0, 100
      halign = center
      valign = center
    }
  '';

  # ── Hypridle — idle daemon ────────────────────────────────────────────
  home.file.".config/hypr/hypridle.conf".text = ''
    general {
      lock_cmd         = hyprlock
      before_sleep_cmd = hyprlock
      after_sleep_cmd  = hyprctl dispatch dpms on
    }

    listener {
      timeout  = 300
      on-timeout = hyprlock
    }

    listener {
      timeout    = 600
      on-timeout = hyprctl dispatch dpms off
      on-resume  = hyprctl dispatch dpms on
    }
  '';

  # ── Hyprpaper — wallpaper daemon ─────────────────────────────────────
  home.file.".config/hypr/hyprpaper.conf".text = ''
    ipc     = on
    splash  = false
    # preload = ~/.config/hypr/wallpaper.jpg
    # wallpaper = ,~/.config/hypr/wallpaper.jpg
  '';

  # ── Color palette (Golden Gold Accent Theme) ─────────────────────────
  home.file.".config/hypr/colors".text = ''
    $background = rgba(1a1a24ee)
    $foreground = rgba(e6e6eeee)
    $color0  = rgba(1a1a24ee)
    $color1  = rgba(ff5555ee)
    $color2  = rgba(e5c07bee)
    $color3  = rgba(f3be53ee)
    $color4  = rgba(ffd700ee)
    $color5  = rgba(e6c368ee)
    $color6  = rgba(f7c04aee)
    $color7  = rgba(e6e6eeee)
    $color8  = rgba(5c5c70ee)
    $color9  = rgba(ff6e6eee)
    $color10 = rgba(e5c07bee)
    $color11 = rgba(f3be53ee)
    $color12 = rgba(ffd700ee)
    $color13 = rgba(e6c368ee)
    $color14 = rgba(f7c04aee)
    $color15 = rgba(ffffffee)
  '';
}
