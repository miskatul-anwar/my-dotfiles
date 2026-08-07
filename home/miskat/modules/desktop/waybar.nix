# Waybar — Hyprdots-inspired floating glassmorphic status bar
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
      height = 38;
      margin-top = 8;
      margin-left = 14;
      margin-right = 14;
      spacing = 10;

      modules-left = [
        "custom/launcher"
        "hyprland/workspaces"
        "hyprland/window"
      ];

      modules-center = [
        "clock"
      ];

      modules-right = [
        "pulseaudio"
        "cpu"
        "memory"
        "network"
        "tray"
        "custom/powermenu"
      ];

      "custom/launcher" = {
        format = "󰣇";
        on-click = "pkill rofi || rofi -show drun";
        tooltip = false;
      };

      "hyprland/workspaces" = {
        disable-scroll = false;
        all-outputs = true;
        active-only = false;
        format = "{icon}";
        format-icons = {
          "1" = "1";
          "2" = "2";
          "3" = "3";
          "4" = "4";
          "5" = "5";
          "6" = "6";
          "7" = "7";
          "8" = "8";
          "9" = "9";
          "10" = "10";
          urgent = "󰵅";
          focused = "";
          default = "";
        };
      };

      "hyprland/window" = {
        format = "󰘔 {title}";
        max-length = 35;
        separate-outputs = true;
      };

      cpu = {
        interval = 2;
        format = "󰍛 {usage}%";
        tooltip = true;
      };

      memory = {
        interval = 2;
        format = "󰻠 {percentage}%";
        states = {
          warning = 80;
          critical = 90;
        };
        tooltip = true;
      };

      clock = {
        interval = 1;
        format = "󰥔 {:%I:%M %p  󰃭 %b %d}";
        tooltip-format = "<tt>{calendar}</tt>";
      };

      pulseaudio = {
        scroll-step = 2;
        format = "{icon} {volume}%";
        format-muted = "󰖁 Muted";
        format-icons = {
          default = [ "󰕿" "󰖀" "󰕾" ];
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
        spacing = 8;
      };

      "custom/powermenu" = {
        format = "";
        on-click = "pkill rofi || wlogout";
        tooltip = false;
      };
    }];

    style = ''
      * {
        font-family: "JetBrainsMono Nerd Font", Roboto, sans-serif;
        font-size: 13px;
        font-weight: bold;
        min-height: 0;
        border: none;
        border-radius: 0;
      }

      window#waybar {
        background-color: transparent;
      }

      /* Hyprdots Floating Island Containers */
      .modules-left, .modules-center, .modules-right {
        background-color: rgba(18, 18, 22, 0.85);
        border: 1px solid rgba(243, 190, 83, 0.30);
        border-radius: 14px;
        padding: 3px 10px;
        margin: 2px 0;
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.4);
      }

      /* Launcher (NixOS / Arch icon) */
      #custom-launcher {
        color: #f3be53;
        font-size: 18px;
        padding-left: 6px;
        padding-right: 12px;
        transition: transform 0.2s ease;
      }
      #custom-launcher:hover {
        color: #ffd700;
        transform: scale(1.15);
      }

      /* Workspaces (Hyprdots Pill Design) */
      #workspaces {
        padding: 0 4px;
      }
      #workspaces button {
        color: #e6e4df;
        padding: 2px 9px;
        margin: 2px 3px;
        border-radius: 10px;
        transition: all 0.2s ease-in-out;
      }
      #workspaces button.active {
        background: linear-gradient(135deg, #f3be53, #ffd700);
        color: #121216;
        box-shadow: 0 0 10px rgba(243, 190, 83, 0.5);
      }
      #workspaces button:hover {
        background-color: rgba(243, 190, 83, 0.35);
        color: #ffffff;
      }
      #workspaces button.urgent {
        background-color: #ff5555;
        color: #ffffff;
      }

      /* Window Title */
      #window {
        color: #e6e4df;
        padding-left: 10px;
        padding-right: 6px;
        font-size: 12px;
      }

      /* Right & Center Modules */
      #cpu, #memory, #clock, #pulseaudio, #network, #tray, #custom-powermenu {
        padding: 2px 10px;
        margin: 2px 2px;
        border-radius: 10px;
        transition: background-color 0.2s ease;
      }

      #cpu {
        color: #e6c368;
      }
      #memory {
        color: #f7c04a;
      }
      #clock {
        color: #f3be53;
        font-size: 13px;
      }
      #pulseaudio {
        color: #ffd700;
      }
      #pulseaudio.muted {
        color: #ff5555;
      }
      #network {
        color: #e5c07b;
      }
      #network.disconnected {
        color: #ff5555;
      }
      #custom-powermenu {
        color: #ff5555;
        padding-right: 8px;
        font-size: 15px;
      }
      #custom-powermenu:hover {
        color: #ff6e6e;
        transform: scale(1.1);
      }

      #tray {
        padding-left: 8px;
        padding-right: 8px;
      }

      /* Tooltip styling */
      tooltip {
        background-color: rgba(18, 18, 22, 0.95);
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
