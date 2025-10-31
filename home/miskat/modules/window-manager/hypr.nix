{ config, lib, pkgs, ... }:

{
  imports = [
    ./env.nix
  ];

  home.packages = with pkgs; [
    waybar
    swww
    kitty
    nautilus
    wofi
    rofi
    grim
    slurp
    wl-clipboard
    playerctl
    pamixer
    light
    dunst
    hyprlock
    hyprpaper
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    systemdIntegration = true;
    extraConfig = ''
      # Monitor configuration
      monitor=,1920x1080@60,auto,1.25

      # Startup Environment
      exec = systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP
      exec = dbus-update-activation-environment --systemd DISPLAY WAYLAND_DISPLAY XDG_CURRENT_DESKTOP

      exec-once = hyprctl setcursor Bibata-Modern-Classic 24
      exec-once = dunst
      source = ~/.config/hypr/colors

      exec = pkill waybar; sleep 0.5; waybar
      exec-once = swww init; sleep 0.5; wallpaper_random

      input {
        kb_layout = us
        kb_options =
        follow_mouse = 1
        sensitivity = 0

        touchpad {
          natural_scroll = true
          disable_while_typing = true
          tap-to-click = true
        }
      }

      general {
        gaps_in = 5
        gaps_out = 20
        border_size = 2
        col.active_border = rgba(33ccffee) rgba(00ff99ee) 45deg
        col.inactive_border = rgba(595959aa)
        layout = dwindle
      }

      decoration {
        rounding = 10
        # Drop shadow is not available; shadow_offset and shadow_opacity removed
      }

      animations {
        enabled = yes
        bezier = ease,0.4,0.02,0.21,1
        animation = windows, 1, 3.5, ease, slide
        animation = windowsOut, 1, 3.5, ease, slide
        animation = border, 1, 6, default
        animation = fade, 1, 3, ease
        animation = workspaces, 1, 3.5, ease
      }

      dwindle {
        pseudotile = yes
        preserve_split = yes
      }

      # Window rules (no regex, just the class name)
      windowrulev2 = float, class:kitty
      windowrulev2 = center, class:kitty
      windowrulev2 = size 600 500, class:kitty
      windowrulev2 = float, class:pavucontrol
      windowrulev2 = float, class:blueman-manager
      windowrulev2 = float, class:mpv
      windowrulev2 = center, class:mpv
      windowrulev2 = size 934 525, class:mpv

      $mainMod = SUPER

      # --- KEYBINDINGS ---
      bind = $mainMod, B, exec, firefox
      bind = $mainMod, RETURN, exec, kitty
      bind = $mainMod, S, exec, grim -g "$(slurp)" - | wl-copy
      bind = $mainMod SHIFT, S, exec, grim -g "$(slurp)"
      bind = $mainMod, L, exec, hyprlock
      bind = $mainMod, C, exec, codium
      bind = $mainMod, t, exec, telegram-desktop
      bind = $mainMod, E, exec, nautilus

      bind = $mainMod, Q, killactive,
      bind = $mainMod, M, exit,
      bind = $mainMod, V, togglefloating,
      bind = $mainMod, w, exec, wofi --show drun
      bind = $mainMod, R, exec, rofi -show window
      bind = $mainMod, P, pseudo,
      bind = $mainMod, J, togglesplit,

      # Switch Keyboard Layouts
      bind = $mainMod, SPACE, exec, hyprctl switchxkblayout teclado-gamer-husky-blizzard next

      bind = , Print, exec, grim -g "$(slurp)" - | wl-copy
      bind = SHIFT, Print, exec, grim -g "$(slurp)"

      # Functional keybinds
      bind =,XF86AudioMicMute,exec,pamixer --default-source -t
      bind =,XF86MonBrightnessDown,exec,light -U 20
      bind =,XF86MonBrightnessUp,exec,light -A 20
      bind =,XF86AudioMute,exec,pamixer -t
      bind =,XF86AudioLowerVolume,exec,pamixer -d 10
      bind =,XF86AudioRaiseVolume,exec,pamixer -i 10
      bind =,XF86AudioPlay,exec,playerctl play-pause
      bind =,XF86AudioPause,exec,playerctl play-pause

      # Switch between windows in a floating workspace
      bind = SUPER,Tab,cyclenext,
      bind = SUPER,Tab,bringactivetotop,

      # Move focus with mainMod + arrow keys
      bind = $mainMod, left, movefocus, l
      bind = $mainMod, right, movefocus, r
      bind = $mainMod, up, movefocus, u
      bind = $mainMod, down, movefocus, d

      # Switch workspaces with mainMod + [0-9]
      bind = $mainMod, 1, workspace, 1
      bind = $mainMod, 2, workspace, 2
      bind = $mainMod, 3, workspace, 3
      bind = $mainMod, 4, workspace, 4
      bind = $mainMod, 5, workspace, 5
      bind = $mainMod, 6, workspace, 6
      bind = $mainMod, 7, workspace, 7
      bind = $mainMod, 8, workspace, 8
      bind = $mainMod, 9, workspace, 9
      bind = $mainMod, 0, workspace, 10

      # Move active window to a workspace with mainMod + SHIFT + [0-9]
      bind = $mainMod SHIFT, 1, movetoworkspace, 1
      bind = $mainMod SHIFT, 2, movetoworkspace, 2
      bind = $mainMod SHIFT, 3, movetoworkspace, 3
      bind = $mainMod SHIFT, 4, movetoworkspace, 4
      bind = $mainMod SHIFT, 5, movetoworkspace, 5
      bind = $mainMod SHIFT, 6, movetoworkspace, 6
      bind = $mainMod SHIFT, 7, movetoworkspace, 7
      bind = $mainMod SHIFT, 8, movetoworkspace, 8
      bind = $mainMod SHIFT, 9, movetoworkspace, 9
      bind = $mainMod SHIFT, 0, movetoworkspace, 10

      # Scroll through existing workspaces with mainMod + scroll
      bind = $mainMod, mouse_down, workspace, e+1
      bind = $mainMod, mouse_up, workspace, e-1

      # Move/resize windows with mainMod + LMB/RMB and dragging
      bindm = $mainMod, mouse:272, movewindow
      bindm = $mainMod, mouse:273, resizewindow
      bindm = ALT, mouse:272, resizewindow

      # --- Unbind any problematic keybindings ---
      # There is no default Hyprland binding for shift+; or :, so this should be handled within vim/neovim input settings if still problematic.
    '';
  };

  home.file.".config/hypr/colors".text = ''
$background = rgba(1d192bee)
$foreground = rgba(c3dde7ee)

$color0 = rgba(1d192bee)
$color1 = rgba(465EA7ee)
$color2 = rgba(5A89B6ee)
$color3 = rgba(6296CAee)
$color4 = rgba(73B3D4ee)
$color5 = rgba(7BC7DDee)
$color6 = rgba(9CB4E3ee)
$color7 = rgba(c3dde7ee)
$color8 = rgba(889aa1ee)
$color9 = rgba(465EA7ee)
$color10 = rgba(5A89B6ee)
$color11 = rgba(6296CAee)
$color12 = rgba(73B3D4ee)
$color13 = rgba(7BC7DDee)
$color14 = rgba(9CB4E3ee)
$color15 = rgba(c3dde7ee)
  '';
}
