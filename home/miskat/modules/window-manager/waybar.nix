{ pkgs, ... }:
{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        modules-left = [ "hyprland/workspaces" ];
        modules-center = [ "clock" "calendar" ];
        modules-right = [
          "battery"
          "power"
          "backlight"
          "tray"
        ];
      };
    };
    style = ''
      * {
        font-family: JetBrainsMono, monospace;
        font-size: 14px;
      }
      window#waybar {
        background: #1e1e2e;
        color: #cdd6f4;
      }
    '';
  };

  # Ensure screenshot, battery, brightness tools available
  home.packages = with pkgs; [
    grimblast
    brightnessctl
    hyprlock
    zen-browser
  ];
}