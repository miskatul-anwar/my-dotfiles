# Waybar — modern floating status bar configuration
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
      margin-top = 6;
      margin-left = 12;
      margin-right = 12;
      spacing = 8;

      modules-left = [
        "custom/launcher"
        "hyprland/workspaces"
        "cpu"
        "memory"
      ];

      modules-center = [
        "clock"
      ];

      modules-right = [
        "pulseaudio"
        "network"
        "tray"
        "custom/powermenu"
      ];

      "custom/launcher" = {
        format = "";
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
        format = "󰥔 {:%I:%M %p  %A, %b %d}";
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

      /* Bar containers */
      .modules-left, .modules-center, .modules-right {
        background-color: rgba(29, 25, 43, 0.85);
        border: 1px solid rgba(51, 204, 255, 0.25);
        border-radius: 12px;
        padding: 2px 8px;
        margin: 2px 0;
      }

      /* Launcher */
      #custom-launcher {
        color: #33ccff;
        font-size: 18px;
        padding-left: 8px;
        padding-right: 12px;
        transition: transform 0.2s ease;
      }
      #custom-launcher:hover {
        color: #00ff99;
      }

      /* Workspaces */
      #workspaces {
        padding: 0 4px;
      }
      #workspaces button {
        color: #c3dde7;
        padding: 2px 8px;
        margin: 2px 2px;
        border-radius: 8px;
        transition: all 0.2s ease-in-out;
      }
      #workspaces button.active {
        background: linear-gradient(135deg, #33ccff, #00ff99);
        color: #1d192b;
      }
      #workspaces button:hover {
        background-color: rgba(115, 179, 212, 0.3);
        color: #ffffff;
      }
      #workspaces button.urgent {
        background-color: #ff5555;
        color: #ffffff;
      }

      /* Modules styling */
      #cpu, #memory, #clock, #pulseaudio, #network, #tray, #custom-powermenu {
        padding: 2px 10px;
        margin: 2px 0;
        border-radius: 8px;
      }

      #cpu {
        color: #f5c2e7;
      }
      #memory {
        color: #b5e8e0;
      }
      #clock {
        color: #c3dde7;
      }
      #pulseaudio {
        color: #73b3d4;
      }
      #pulseaudio.muted {
        color: #ff5555;
      }
      #network {
        color: #00ff99;
      }
      #network.disconnected {
        color: #ff5555;
      }
      #custom-powermenu {
        color: #ff5555;
        padding-right: 8px;
        font-size: 14px;
      }
      #custom-powermenu:hover {
        color: #ff6e6e;
      }

      #tray {
        padding-left: 8px;
        padding-right: 8px;
      }

      /* Tooltip styling */
      tooltip {
        background-color: rgba(29, 25, 43, 0.95);
        border: 1px solid rgba(51, 204, 255, 0.4);
        border-radius: 10px;
        padding: 8px;
      }
      tooltip label {
        color: #c3dde7;
      }
    '';
  };
}
