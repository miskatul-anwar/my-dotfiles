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
}
