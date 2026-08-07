# Dunst — lightweight notification daemon for Hyprland / Wayland
{ ... }:
{
  services.dunst = {
    enable = true;
    settings = {
      global = {
        width          = 300;
        height         = 200;
        offset         = "20x50";
        origin         = "top-right";
        transparency   = 10;
        frame_color    = "#89b4fa";
        font           = "JetBrains Mono 10";
        corner_radius  = 10;
        icon_theme     = "Papirus";
        enable_recursive_icon_lookup = true;
      };
      urgency_low = {
        background = "#1e1e2e";
        foreground = "#cdd6f4";
        timeout    = 5;
      };
      urgency_normal = {
        background   = "#1e1e2e";
        foreground   = "#cdd6f4";
        frame_color  = "#89b4fa";
        timeout      = 10;
      };
      urgency_critical = {
        background   = "#1e1e2e";
        foreground   = "#cdd6f4";
        frame_color  = "#f38ba8";
        timeout      = 0;
      };
    };
  };
}
