# Hyprlock — screen locker
{ ... }:
{
  home.file.".config/hypr/hyprlock.conf".text = ''
    background {
      monitor =
      path = screenshot
      blur_passes = 3
      blur_size = 7
      color = rgba(1e1e2eee)
    }

    input-field {
      monitor =
      size = 250, 50
      outline_thickness = 2
      dots_size = 0.2
      dots_center = true
      outer_color = rgba(cba6f7ee)
      inner_color = rgba(1e1e2eee)
      font_color = rgba(cdd6f4ee)
      fade_on_empty = false
      placeholder_text = <span foreground="##cdd6f4">Password</span>
      check_color = rgba(89b4faee)
      fail_color = rgba(f38ba8ee)
      position = 0, -100
      halign = center
      valign = center
    }

    label {
      monitor =
      text = cmd[update:1000] echo "$(date +'%H:%M')"
      color = rgba(cba6f7ee)
      font_size = 64
      font_family = JetBrains Mono Nerd Font Bold
      position = 0, 100
      halign = center
      valign = center
    }
  '';
}
