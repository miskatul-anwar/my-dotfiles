# Dunst Notification Daemon — Glassmorphic Catppuccin Mocha Theme with Translucent Blur & Frame
{ ... }:
{
  services.dunst = {
    enable = true;
    settings = {
      global = {
        width                        = 360;
        height                       = 200;
        offset                       = "24x55";
        origin                       = "top-right";
        transparency                 = 20;
        frame_width                  = 2;
        frame_color                  = "#cba6f7";
        font                         = "JetBrainsMono Nerd Font 10.5";
        corner_radius                = 16;
        icon_theme                   = "Tela-circle-dark";
        enable_recursive_icon_lookup = true;
        icon_position                = "left";
        min_icon_size                = 36;
        max_icon_size                = 48;
        padding                      = 14;
        horizontal_padding           = 18;
        text_icon_padding            = 14;
        separator_color              = "#cba6f7";
        sort                         = "yes";
        idle_threshold               = 120;
        show_indicators              = "yes";
        gap_size                     = 8;
      };

      urgency_low = {
        background  = "#1e1e2eC0";
        foreground  = "#cdd6f4";
        frame_color = "#89b4fa";
        timeout     = 4;
      };

      urgency_normal = {
        background  = "#1e1e2eC0";
        foreground  = "#cdd6f4";
        frame_color = "#cba6f7";
        timeout     = 6;
      };

      urgency_critical = {
        background  = "#1e1e2eC0";
        foreground  = "#f38ba8";
        frame_color = "#f38ba8";
        timeout     = 0;
      };
    };
  };
}
