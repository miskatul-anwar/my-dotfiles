# Dunst Notification Daemon — Glassmorphic Catppuccin Mocha theme with Tela-circle-dark icons
{ ... }:
{
  services.dunst = {
    enable = true;
    settings = {
      global = {
        width                        = 350;
        height                       = 200;
        offset                       = "20x50";
        origin                       = "top-right";
        transparency                 = 10;
        frame_width                  = 2;
        frame_color                  = "#cba6f7";
        font                         = "JetBrainsMono Nerd Font 10.5";
        corner_radius                = 14;
        icon_theme                   = "Tela-circle-dark";
        enable_recursive_icon_lookup = true;
        icon_position                = "left";
        min_icon_size                = 32;
        max_icon_size                = 48;
        padding                      = 12;
        horizontal_padding           = 16;
        text_icon_padding            = 12;
        separator_color              = "frame";
        sort                         = "yes";
        idle_threshold               = 120;
        show_indicators              = "yes";
      };

      urgency_low = {
        background  = "#1e1e2eF0";
        foreground  = "#cdd6f4";
        frame_color = "#89b4fa";
        timeout     = 4;
      };

      urgency_normal = {
        background  = "#1e1e2eF0";
        foreground  = "#cdd6f4";
        frame_color = "#cba6f7";
        timeout     = 6;
      };

      urgency_critical = {
        background  = "#1e1e2eF0";
        foreground  = "#cdd6f4";
        frame_color = "#f38ba8";
        timeout     = 0;
      };
    };
  };
}
