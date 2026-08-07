# Hyprland window manager — user configuration
# Keybindings inspired by prasanthrangan/hyprdots
{ pkgs, ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;
    # stateVersion < 26.05 — keep hyprlang format (not Lua)
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
        "hyprpaper"
        "hypridle"
        "hyprctl setcursor Bibata-Modern-Classic 24"
      ];

      # ── Variables ─────────────────────────────────────────────────────
      "$mainMod" = "SUPER";
      "$term"    = "kitty";
      "$editor"  = "codium";
      "$file"    = "nautilus";
      "$browser" = "google-chrome-stable";

      # ── Input ─────────────────────────────────────────────────────────
      input = {
        kb_layout    = "us";
        follow_mouse = 1;
        sensitivity  = 0;
        touchpad = {
          natural_scroll     = true;
          disable_while_typing = true;
          tap-to-click       = true;
        };
      };

      # ── General ───────────────────────────────────────────────────────
      general = {
        gaps_in              = 5;
        gaps_out             = 20;
        border_size          = 2;
        "col.active_border"  = "rgba(33ccffee) rgba(00ff99ee) 45deg";
        "col.inactive_border" = "rgba(595959aa)";
        layout               = "dwindle";
      };

      # ── Decoration ────────────────────────────────────────────────────
      decoration = {
        rounding = 10;
        blur = {
          enabled = true;
          size    = 3;
          passes  = 1;
        };
        shadow.enabled = false;
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
        pseudotile     = true;
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

  # ── Color palette ─────────────────────────────────────────────────────
  home.file.".config/hypr/colors".text = ''
    $background = rgba(1d192bee)
    $foreground = rgba(c3dde7ee)
    $color0  = rgba(1d192bee)
    $color1  = rgba(465EA7ee)
    $color2  = rgba(5A89B6ee)
    $color3  = rgba(6296CAee)
    $color4  = rgba(73B3D4ee)
    $color5  = rgba(7BC7DDee)
    $color6  = rgba(9CB4E3ee)
    $color7  = rgba(c3dde7ee)
    $color8  = rgba(889aa1ee)
    $color9  = rgba(465EA7ee)
    $color10 = rgba(5A89B6ee)
    $color11 = rgba(6296CAee)
    $color12 = rgba(73B3D4ee)
    $color13 = rgba(7BC7DDee)
    $color14 = rgba(9CB4E3ee)
    $color15 = rgba(c3dde7ee)
  '';
}
