{ config, pkgs, ... }:
let
  gruv = {
    bg0 = "#282828";
    bg1 = "#3c3836";
    fg  = "#ebdbb2";
    red = "#fb4934";
    green = "#b8bb26";
    yellow = "#fabd2f";
    blue = "#83a598";
    purple = "#d3869b";
    aqua = "#8ec07c";
    orange = "#fe8019";
    gray = "#a89984";
  };
in
{
  programs.sway = {
    enable = true;
    extraConfig = ''
      set $mod Mod4

      # Gruvbox colors
      client.background                 ${gruv.bg0}
      client.focused                    ${gruv.blue} ${gruv.bg0} ${gruv.fg} ${gruv.blue} ${gruv.fg}
      client.unfocused                  ${gruv.bg1} ${gruv.bg0} ${gruv.gray} ${gruv.bg1} ${gruv.gray}
      client.urgent                     ${gruv.red} ${gruv.bg0} ${gruv.fg} ${gruv.red} ${gruv.fg}
      default_border pixel 2
      font pango:DejaVu Sans Mono 11

      # Keybindings
      bindsym $mod+Return exec kitty
      bindsym $mod+s exec grim - | wl-copy
      bindsym $mod+Shift+s exec grim -g "$(slurp)" - | wl-copy
      bindsym $mod+A exec dmenu_path | dmenu | xargs swaymsg exec --
      bindsym $mod+B exec zen
      bindsym $mod+C exec code
      bindsym $mod+L exec swaylock --color ${gruv.bg0}

      # Workspace switcher
      set $ws1 "1"
      set $ws2 "2"
      set $ws3 "3"
      set $ws4 "4"
      set $ws5 "5"
      bindsym $mod+1 workspace $ws1
      bindsym $mod+2 workspace $ws2
      bindsym $mod+3 workspace $ws3
      bindsym $mod+4 workspace $ws4
      bindsym $mod+5 workspace $ws5

      # Notification daemon
      exec mako

      # Waybar
      exec waybar
    '';
  };

  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        modules-left = [ "workspaces" "window" ];
        modules-center = [ "clock" ];
        modules-right = [ "tray" "network" "battery" ];
        "network" = {
          format-wifi = "  {essid} ({signalStrength}%)";
          format-ethernet = "  {ifname}";
          format-disconnected = " Disconnected";
        };
        "battery" = {
          format = "{icon} {capacity}%";
          format-charging = " {capacity}%";
          format-plugged = " {capacity}%";
          format-icons = [ "" "" "" "" "" ];
        };
        "clock" = {
          format = "{:%a %d %b %H:%M}";
        };
      };
    };
    style = ''
      * {
        font-family: DejaVu Sans Mono, monospace;
        font-size: 13px;
      }
      window {
        background: ${gruv.bg0};
        color: ${gruv.fg};
      }
      #workspaces button {
        background: ${gruv.bg1};
        color: ${gruv.fg};
        border-radius: 5px;
        margin: 2px;
        padding: 4px 8px;
      }
      #workspaces button.active {
        background: ${gruv.blue};
        color: ${gruv.bg0};
      }
      #window {
        color: ${gruv.yellow};
        padding: 0 10px;
      }
      #network {
        color: ${gruv.aqua};
        padding: 0 10px;
      }
      #battery {
        color: ${gruv.green};
        padding: 0 10px;
      }
      #clock {
        background: ${gruv.bg1};
        color: ${gruv.orange};
        border-radius: 6px;
        padding: 0 12px;
        margin: 2px;
      }
      #tray {
        background: ${gruv.bg1};
        border-radius: 5px;
        margin: 2px;
        padding: 0 6px;
      }
    '';
  };
}
