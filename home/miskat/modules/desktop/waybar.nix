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
        "pulseaudio"
        "tray"
        "custom/notification"
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

      "custom/notification" = {
        format = "󰂚";
        on-click = "swaync-client -t -sw";
        tooltip = false;
      };

      "custom/exit" = {
        format = "";
        on-click = "pkill rofi || wlogout";
        tooltip = false;
      };
    }];

    style = builtins.readFile ./waybar/style.css;
  };
}
