# Hyprlock — screen locker
{ ... }:
{
  home.file.".config/hypr/hyprlock.conf".text = ''
    background {
      monitor =
      path = screenshot
      blur_passes = 3
      blur_size = 7
      color = rgba(121216ee)
    }

    input-field {
      monitor =
      size = 250, 50
      outline_thickness = 2
      dots_size = 0.2
      dots_center = true
      outer_color = rgba(f3be53ee)
      inner_color = rgba(121216ee)
      font_color = rgba(e6e4dfee)
      fade_on_empty = false
      placeholder_text = <span foreground="##e6e4df">Password</span>
      check_color = rgba(ffd700ee)
      fail_color = rgba(ff5555ee)
      position = 0, -100
      halign = center
      valign = center
    }

    label {
      monitor =
      text = cmd[update:1000] echo "$(date +'%H:%M')"
      color = rgba(f3be53ee)
      font_size = 64
      font_family = JetBrains Mono Nerd Font Bold
      position = 0, 100
      halign = center
      valign = center
    }
  '';
}
