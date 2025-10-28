{ pkgs, ... }:
{
  programs.rofi = {
    enable = true;
    theme = "Arc";
    extraConfig = {
      modi = "drun,window,keys";
      show-icons = true;
      drun-show-actions = true;
    };
  };

  # Make sure code and zen-browser are available for launchers
  home.packages = with pkgs; [
    vscode
    zen-browser
  ];
}