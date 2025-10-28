{ inputs, pkgs, ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    systemd.enable = true;
  };

  programs.kitty.enable = true;
  programs.vscode.enable = true;
  programs.rofi.enable = true;
}
