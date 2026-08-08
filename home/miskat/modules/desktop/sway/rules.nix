# Sway Window Rules & Floating Windows
{ ... }:
{
  wayland.windowManager.sway.config.window.commands = [
    {
      command = "floating enable";
      criteria = { app_id = "pavucontrol"; };
    }
    {
      command = "floating enable";
      criteria = { app_id = "blueman-manager"; };
    }
    {
      command = "floating enable";
      criteria = { app_id = "nm-connection-editor"; };
    }
    {
      command = "floating enable";
      criteria = { app_id = "org.gnome.Calculator"; };
    }
    {
      command = "floating enable";
      criteria = { title = "File Operation Progress"; };
    }
    {
      command = "floating enable";
      criteria = { title = "Open File"; };
    }

    # Disable borders on single window
    {
      command = "border pixel 0";
      criteria = { title = ".*"; };
    }
  ];
}
