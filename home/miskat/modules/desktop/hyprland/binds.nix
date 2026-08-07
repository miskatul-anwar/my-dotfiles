# Hyprland Keybindings — ZaneyOS Ruleset
{ ... }:
{
  wayland.windowManager.hyprland.settings = {
    bind = [
      # ── Terminal & Launchers ──────────────────────────────────────────
      "$mainMod, Return, exec, kitty"
      "$mainMod, D, exec, pkill -x rofi || rofi -show drun"
      "$mainMod SHIFT, Return, exec, pkill -x rofi || rofi -show drun"
      "$mainMod, W, exec, google-chrome-stable"
      "$mainMod SHIFT, W, exec, anime-wallpaper"
      "$mainMod, Y, exec, kitty -e yazi"
      "$mainMod, T, exec, nautilus"
      "$mainMod, E, exec, nautilus"
      "$mainMod, C, exec, kitty -e nvim"
      "$mainMod, V, exec, cliphist list | rofi -dmenu | cliphist decode | wl-copy"

      # ── Screenshots & Utilities (ZaneyOS Hyprshot & Grim) ────────────
      "$mainMod, S, exec, grim -g \"$(slurp)\" - | wl-copy"
      "$mainMod CTRL, S, exec, grim - | wl-copy"
      "$mainMod SHIFT, S, exec, grim -g \"$(slurp)\" ~/Pictures/Screenshots/$(date +%Y%m%d_%H%M%S).png"
      "$mainMod ALT, C, exec, hyprpicker -a"
      "$mainMod ALT, M, exec, pavucontrol"

      # ── Window Management (ZaneyOS Dispatchers) ───────────────────────
      "$mainMod, Q, killactive"
      "$mainMod, F, fullscreen"
      "$mainMod SHIFT, F, togglefloating"
      "$mainMod, P, pseudo"
      "$mainMod SHIFT, I, layoutmsg, togglesplit"
      "$mainMod SHIFT, C, exit"
      "$mainMod, L, exec, hyprlock"
      "$mainMod, Backspace, exec, wlogout"

      # ── Focus Movement (Arrow Keys + Vim HJKL) ────────────────────────
      "$mainMod, left, movefocus, l"
      "$mainMod, right, movefocus, r"
      "$mainMod, up, movefocus, u"
      "$mainMod, down, movefocus, d"
      "$mainMod, H, movefocus, l"
      "$mainMod, L, movefocus, r"
      "$mainMod, K, movefocus, u"
      "$mainMod, J, movefocus, d"

      # ── Move Window (Super + Shift + Arrow Keys / HJKL) ────────────────
      "$mainMod SHIFT, left, movewindow, l"
      "$mainMod SHIFT, right, movewindow, r"
      "$mainMod SHIFT, up, movewindow, u"
      "$mainMod SHIFT, down, movewindow, d"
      "$mainMod SHIFT, H, movewindow, l"
      "$mainMod SHIFT, L, movewindow, r"
      "$mainMod SHIFT, K, movewindow, u"
      "$mainMod SHIFT, J, movewindow, d"

      # ── Swap Window (Super + Alt + Arrow Keys) ────────────────────────
      "$mainMod ALT, left, swapwindow, l"
      "$mainMod ALT, right, swapwindow, r"
      "$mainMod ALT, up, swapwindow, u"
      "$mainMod ALT, down, swapwindow, d"

      # ── Window Cycling ────────────────────────────────────────────────
      "ALT, Tab, cyclenext"
      "ALT, Tab, bringactivetotop"

      # ── Workspace Switching (1..10) ────────────────────────────────────
      "$mainMod, 1, workspace, 1"
      "$mainMod, 2, workspace, 2"
      "$mainMod, 3, workspace, 3"
      "$mainMod, 4, workspace, 4"
      "$mainMod, 5, workspace, 5"
      "$mainMod, 6, workspace, 6"
      "$mainMod, 7, workspace, 7"
      "$mainMod, 8, workspace, 8"
      "$mainMod, 9, workspace, 9"
      "$mainMod, 0, workspace, 10"

      # ── Move Window to Workspace ──────────────────────────────────────
      "$mainMod SHIFT, 1, movetoworkspace, 1"
      "$mainMod SHIFT, 2, movetoworkspace, 2"
      "$mainMod SHIFT, 3, movetoworkspace, 3"
      "$mainMod SHIFT, 4, movetoworkspace, 4"
      "$mainMod SHIFT, 5, movetoworkspace, 5"
      "$mainMod SHIFT, 6, movetoworkspace, 6"
      "$mainMod SHIFT, 7, movetoworkspace, 7"
      "$mainMod SHIFT, 8, movetoworkspace, 8"
      "$mainMod SHIFT, 9, movetoworkspace, 9"
      "$mainMod SHIFT, 0, movetoworkspace, 10"

      # ── Workspace Navigation & Special Workspaces ──────────────────────
      "$mainMod CONTROL, right, workspace, e+1"
      "$mainMod CONTROL, left, workspace, e-1"
      "$mainMod, mouse_down, workspace, e+1"
      "$mainMod, mouse_up, workspace, e-1"
      "$mainMod, SPACE, togglespecialworkspace"
      "$mainMod SHIFT, SPACE, movetoworkspace, special"
    ];

    # ── Repeatable Binds (Resize / Volume / Brightness) ──────────────────
    binde = [
      "$mainMod CTRL, right, resizeactive, 20 0"
      "$mainMod CTRL, left, resizeactive, -20 0"
      "$mainMod CTRL, up, resizeactive, 0 -20"
      "$mainMod CTRL, down, resizeactive, 0 20"
      ", XF86AudioRaiseVolume, exec, pamixer -i 5"
      ", XF86AudioLowerVolume, exec, pamixer -d 5"
      ", XF86MonBrightnessUp, exec, brightnessctl s +5%"
      ", XF86MonBrightnessDown, exec, brightnessctl s 5%-"
    ];

    # ── Locked / Media Keys ─────────────────────────────────────────────
    bindl = [
      ", XF86AudioMute, exec, pamixer -t"
      ", XF86AudioPlay, exec, playerctl play-pause"
      ", XF86AudioPause, exec, playerctl play-pause"
      ", XF86AudioNext, exec, playerctl next"
      ", XF86AudioPrev, exec, playerctl previous"
      ", XF86AudioMicMute, exec, pamixer --default-source -t"
    ];

    # ── Mouse Window Drag / Resize ──────────────────────────────────────
    bindm = [
      "$mainMod, mouse:272, movewindow"
      "$mainMod, mouse:273, resizewindow"
      "ALT, mouse:272, resizewindow"
    ];
  };
}
