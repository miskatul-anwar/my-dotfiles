# Sway Keybindings — High-Cohesion Modular Binds (Identical to ZaneyOS Hyprland)
{ config, pkgs, ... }:
let
  mod = "Mod4";
in
{
  wayland.windowManager.sway.config.keybindings = {
    # ── Terminal & Launchers ──────────────────────────────────────────
    "${mod}+Return"       = "exec ${pkgs.kitty}/bin/kitty";
    "${mod}+d"            = "exec pkill -x rofi || ${pkgs.rofi}/bin/rofi -show drun";
    "${mod}+Shift+Return" = "exec pkill -x rofi || ${pkgs.rofi}/bin/rofi -show drun";
    "${mod}+w"            = "exec google-chrome-stable";
    "${mod}+Shift+w"      = "exec set-wallpaper";
    "${mod}+y"            = "exec ${pkgs.kitty}/bin/kitty -e yazi";
    "${mod}+e"            = "exec nautilus";
    "${mod}+c"            = "exec ${pkgs.kitty}/bin/kitty -e nvim";
    "${mod}+v"            = "exec cliphist list | rofi -dmenu | cliphist decode | wl-copy";
    "${mod}+n"            = "exec swaync-client -t -sw";

    # ── Screenshots & Media Utilities ───────────────────────────────
    "Print"               = "exec grim -g \"$(slurp)\" - | wl-copy";
    "${mod}+Control+s"    = "exec mkdir -p ~/Pictures/Screenshots && grim -g \"$(slurp)\" ~/Pictures/Screenshots/$(date +'%Y-%m-%d_%H-%M-%S').png";
    "${mod}+Shift+s"      = "exec grim -g \"$(slurp)\" - | wl-copy";
    "${mod}+Alt+m"        = "exec pavucontrol";

    # ── Window Management & Session Controls ─────────────────────────
    "${mod}+q"            = "kill";
    "${mod}+f"            = "fullscreen toggle";
    "${mod}+Shift+f"      = "floating toggle";
    "${mod}+Shift+c"      = "reload";
    "${mod}+Control+l"    = "exec swaylock";
    "${mod}+Escape"       = "exec swaylock";
    "${mod}+Backspace"    = "exec wlogout";

    # ── Focus Navigation (Arrow Keys & Vim HJKL) ──────────────────────
    "${mod}+Left"         = "focus left";
    "${mod}+Right"        = "focus right";
    "${mod}+Up"           = "focus up";
    "${mod}+Down"         = "focus down";
    "${mod}+h"            = "focus left";
    "${mod}+l"            = "focus right";
    "${mod}+k"            = "focus up";
    "${mod}+j"            = "focus down";

    # ── Move Window (Super + Shift + Arrows / HJKL) ───────────────────
    "${mod}+Shift+Left"   = "move left";
    "${mod}+Shift+Right"  = "move right";
    "${mod}+Shift+Up"     = "move up";
    "${mod}+Shift+Down"   = "move down";
    "${mod}+Shift+h"      = "move left";
    "${mod}+Shift+l"      = "move right";
    "${mod}+Shift+k"      = "move up";
    "${mod}+Shift+j"      = "move down";

    # ── Layout Splitting ──────────────────────────────────────────────
    "${mod}+b"            = "splith";
    "${mod}+Shift+v"      = "splitv";
    "${mod}+Shift+t"      = "layout tabbed";

    # ── Workspace Switching (1..10) ────────────────────────────────────
    "${mod}+1"            = "workspace number 1";
    "${mod}+2"            = "workspace number 2";
    "${mod}+3"            = "workspace number 3";
    "${mod}+4"            = "workspace number 4";
    "${mod}+5"            = "workspace number 5";
    "${mod}+6"            = "workspace number 6";
    "${mod}+7"            = "workspace number 7";
    "${mod}+8"            = "workspace number 8";
    "${mod}+9"            = "workspace number 9";
    "${mod}+0"            = "workspace number 10";

    # ── Move Window to Workspace ──────────────────────────────────────
    "${mod}+Shift+1"      = "move container to workspace number 1";
    "${mod}+Shift+2"      = "move container to workspace number 2";
    "${mod}+Shift+3"      = "move container to workspace number 3";
    "${mod}+Shift+4"      = "move container to workspace number 4";
    "${mod}+Shift+5"      = "move container to workspace number 5";
    "${mod}+Shift+6"      = "move container to workspace number 6";
    "${mod}+Shift+7"      = "move container to workspace number 7";
    "${mod}+Shift+8"      = "move container to workspace number 8";
    "${mod}+Shift+9"      = "move container to workspace number 9";
    "${mod}+Shift+0"      = "move container to workspace number 10";

    # ── Scratchpad ────────────────────────────────────────────────────
    "${mod}+Shift+minus"  = "move scratchpad";
    "${mod}+minus"        = "scratchpad show";

    # ── Media & System Hardware Keys ──────────────────────────────────
    "XF86AudioRaiseVolume"  = "exec pamixer -i 5";
    "XF86AudioLowerVolume"  = "exec pamixer -d 5";
    "XF86AudioMute"         = "exec pamixer -t";
    "XF86AudioMicMute"      = "exec pamixer --default-source -t";
    "XF86AudioPlay"         = "exec playerctl play-pause";
    "XF86AudioNext"         = "exec playerctl next";
    "XF86AudioPrev"         = "exec playerctl previous";
    "XF86MonBrightnessUp"   = "exec brightnessctl s +5%";
    "XF86MonBrightnessDown" = "exec brightnessctl s 5%-";
  };
}
