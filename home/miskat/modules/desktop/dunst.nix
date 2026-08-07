# Dunst — lightweight notification daemon for Hyprland / Wayland
{ ... }:
{
  services.dunst = {
    enable = true;
    settings = {
      global = {
        width          = 320;
        height         = 200;
        offset         = "20x50";
        origin         = "top-right";
        transparency   = 10;
        frame_color    = "#f3be53";
        font           = "JetBrains Mono Nerd Font 10";
        corner_radius  = 10;
        icon_theme     = "Papirus";
        enable_recursive_icon_lookup = true;
      };
      urgency_low = {
        background = "#121216";
        foreground = "#e6e4df";
        frame_color = "#282832";
        timeout    = 5;
      };
      urgency_normal = {
        background   = "#121216";
        foreground   = "#e6e4df";
        frame_color  = "#f3be53";
        timeout      = 10;
      };
      urgency_critical = {
        background   = "#121216";
        foreground   = "#e6e4df";
        frame_color  = "#ff5555";
        timeout      = 0;
      };
    };
  };
}
