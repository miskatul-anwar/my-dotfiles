# Hyprland Window Rules
{ ... }:
{
  wayland.windowManager.hyprland.settings = {
    windowrule = [
      "opacity 0.90 0.90, ^(Google-chrome)$"
      "opacity 0.90 0.90, ^(firefox)$"
      "opacity 0.85 0.85, ^([Cc]odium)$"
      "opacity 0.85 0.85, ^(kitty)$"
      "opacity 0.85 0.75, ^(org.pulseaudio.pavucontrol)$"
      "opacity 0.85 0.75, ^(blueman-manager)$"
      "float, ^(pavucontrol)$"
      "float, ^(org.pulseaudio.pavucontrol)$"
      "float, ^(blueman-manager)$"
      "float, ^(mpv)$"
      "center, ^(mpv)$"
      "size 934 525, ^(mpv)$"
      "float, ^(nm-connection-editor)$"
      "float, title:^(Picture-in-Picture)$"
      "pin, title:^(Picture-in-Picture)$"
    ];
  };
}
