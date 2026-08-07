# Hyprland Window Rules
{ ... }:
{
  wayland.windowManager.hyprland.settings = {
    windowrule = [
      "opacity 0.90 0.90, class:^(Google-chrome)$"
      "opacity 0.85 0.85, class:^(kitty)$"
      "opacity 0.85 0.75, class:^(org.pulseaudio.pavucontrol)$"
      "opacity 0.85 0.75, class:^(blueman-manager)$"
      "float, class:^(pavucontrol)$"
      "float, class:^(org.pulseaudio.pavucontrol)$"
      "float, class:^(blueman-manager)$"
      "float, class:^(mpv)$"
      "center, class:^(mpv)$"
      "size 934 525, class:^(mpv)$"
      "float, class:^(nm-connection-editor)$"
      "float, title:^(Picture-in-Picture)$"
      "pin, title:^(Picture-in-Picture)$"
    ];

    layerrule = [
      "blur, waybar"
      "ignorezero, waybar"
    ];
  };
}
