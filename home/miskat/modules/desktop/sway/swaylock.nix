# SwayLock — Catppuccin Mocha Styled Lockscreen
{ pkgs, ... }:
{
  programs.swaylock = {
    enable = true;
    package = pkgs.swaylock;
    settings = {
      color = "1e1e2e";
      font = "JetBrainsMono Nerd Font";
      font-size = 24;
      indicator-radius = 100;
      indicator-thickness = 7;

      ring-color = "b4befe";
      ring-clear-color = "a6e3a1";
      ring-caps-lock-color = "fab387";
      ring-ver-color = "89b4fa";
      ring-wrong-color = "f38ba8";

      inside-color = "1e1e2e00";
      inside-clear-color = "1e1e2e00";
      inside-caps-lock-color = "1e1e2e00";
      inside-ver-color = "1e1e2e00";
      inside-wrong-color = "1e1e2e00";

      line-color = "11111b";
      line-clear-color = "11111b";
      line-caps-lock-color = "11111b";
      line-ver-color = "11111b";
      line-wrong-color = "11111b";

      text-color = "cdd6f4";
      text-clear-color = "a6e3a1";
      text-caps-lock-color = "fab387";
      text-ver-color = "89b4fa";
      text-wrong-color = "f38ba8";

      show-failed-attempts = true;
      daemonize = true;
    };
  };
}
