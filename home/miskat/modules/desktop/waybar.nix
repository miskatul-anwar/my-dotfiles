# Waybar — ZaneyOS Curved Glassmorphic Bar Configuration
{ pkgs, ... }:
{
  programs.waybar = {
    enable = true;
    systemd = {
      enable = false;
      targets = [ "graphical-session.target" ];
    };

    settings = [{
      layer = "top";
      position = "top";
      height = 36;
      margin-top = 0;
      margin-left = 0;
      margin-right = 0;
      spacing = 0;

      modules-left = [
        "custom/startmenu"
        "hyprland/window"
        "pulseaudio"
        "cpu"
        "memory"
      ];

      modules-center = [
        "hyprland/workspaces"
      ];

      modules-right = [
        "network"
        "tray"
        "custom/exit"
        "clock"
      ];

      "custom/startmenu" = {
        format = "";
        on-click = "pkill rofi || rofi -show drun";
        tooltip = false;
      };

      "hyprland/workspaces" = {
        disable-scroll = false;
        all-outputs = true;
        active-only = false;
        format = "{name}";
        on-click = "activate";
      };

      "hyprland/window" = {
        format = "󰘔 {title}";
        max-length = 26;
        separate-outputs = true;
      };

      cpu = {
        interval = 2;
        format = " {usage}%";
        tooltip = true;
      };

      memory = {
        interval = 2;
        format = " {percentage}%";
        states = {
          warning = 80;
          critical = 90;
        };
        tooltip = true;
      };

      clock = {
        interval = 1;
        format = " {:%I:%M %p  󰃭 %b %d}";
        tooltip-format = "<tt>{calendar}</tt>";
      };

      pulseaudio = {
        scroll-step = 2;
        format = "{icon} {volume}%";
        format-muted = " Muted";
        format-icons = {
          default = [ "" "" "" ];
        };
        on-click = "pamixer -t";
        on-click-right = "pavucontrol";
        tooltip = false;
      };

      network = {
        format-wifi = "󰤨 {essid}";
        format-ethernet = "󰒢 Connected";
        format-linked = "󰤨 {essid} (No IP)";
        format-disconnected = "󰤭 Disconnected";
        tooltip-format = "{ifname}: {ipaddr}/{cidr}";
        on-click = "nm-connection-editor";
      };

      tray = {
        icon-size = 16;
        spacing = 10;
      };

      "custom/exit" = {
        format = "";
        on-click = "pkill rofi || wlogout";
        tooltip = false;
      };
    }];

    style = ''
      * {
        font-family: "JetBrainsMono Nerd Font", Roboto, sans-serif;
        font-size: 14px;
        font-weight: bold;
        min-height: 0px;
        border: none;
        border-radius: 0px;
      }

      window#waybar {
        background: transparent;
      }

      /* ZaneyOS Start Menu (Curved Bottom-Right) */
      #custom-startmenu {
        color: #121216;
        background: linear-gradient(135deg, #f3be53, #ffd700);
        font-size: 22px;
        margin: 0px;
        padding: 0px 24px 0px 14px;
        border-radius: 0px 0px 30px 0px;
        box-shadow: 2px 2px 8px rgba(0, 0, 0, 0.5);
      }

      /* ZaneyOS Workspaces (Center Floating Pill) */
      #workspaces {
        background: rgba(18, 18, 22, 0.90);
        border: 1px solid rgba(243, 190, 83, 0.35);
        margin: 4px 0px;
        padding: 3px 6px;
        border-radius: 16px;
      }
      #workspaces button {
        font-weight: bold;
        padding: 0px 8px;
        margin: 0px 3px;
        border-radius: 12px;
        color: #e6e4df;
        background: rgba(40, 40, 50, 0.6);
        opacity: 0.7;
      }
      #workspaces button.active {
        font-weight: bold;
        padding: 0px 10px;
        margin: 0px 3px;
        border-radius: 12px;
        color: #121216;
        background: linear-gradient(135deg, #f3be53, #ffd700);
        opacity: 1.0;
        min-width: 32px;
        box-shadow: 0 0 10px rgba(243, 190, 83, 0.5);
      }
      #workspaces button:hover {
        background: rgba(243, 190, 83, 0.4);
        color: #ffffff;
        opacity: 0.9;
      }

      /* ZaneyOS Left Curved Modules (20px 8px 20px 8px) */
      #window, #pulseaudio, #cpu, #memory {
        font-weight: bold;
        margin: 4px 0px;
        margin-left: 8px;
        padding: 0px 14px;
        background: rgba(18, 18, 22, 0.88);
        border: 1px solid rgba(243, 190, 83, 0.30);
        color: #e6e4df;
        border-radius: 20px 8px 20px 8px;
      }

      #window {
        color: #f3be53;
        font-size: 13px;
      }
      #pulseaudio {
        color: #ffd700;
      }
      #pulseaudio.muted {
        color: #ff5555;
      }
      #cpu {
        color: #e6c368;
      }
      #memory {
        color: #f7c04a;
      }

      /* ZaneyOS Right Curved Modules (8px 20px 8px 20px) */
      #network, #tray, #custom-exit {
        font-weight: bold;
        background: rgba(18, 18, 22, 0.88);
        border: 1px solid rgba(243, 190, 83, 0.30);
        color: #e6e4df;
        margin: 4px 0px;
        margin-right: 8px;
        border-radius: 8px 20px 8px 20px;
        padding: 0px 14px;
      }

      #network {
        color: #e5c07b;
      }
      #network.disconnected {
        color: #ff5555;
      }
      #custom-exit {
        color: #ff5555;
        font-size: 15px;
        padding-right: 12px;
      }
      #custom-exit:hover {
        color: #ff6e6e;
      }

      /* ZaneyOS Clock (Curved Bottom-Left) */
      #clock {
        font-weight: bold;
        color: #121216;
        background: linear-gradient(135deg, #f3be53, #ffd700);
        margin: 0px;
        padding: 0px 16px 0px 24px;
        border-radius: 0px 0px 0px 30px;
        box-shadow: -2px 2px 8px rgba(0, 0, 0, 0.5);
      }

      /* Tooltip Styling */
      tooltip {
        background: rgba(18, 18, 22, 0.95);
        border: 1px solid rgba(243, 190, 83, 0.4);
        border-radius: 12px;
        padding: 8px;
      }
      tooltip label {
        color: #e6e4df;
      }
    '';
  };
}
