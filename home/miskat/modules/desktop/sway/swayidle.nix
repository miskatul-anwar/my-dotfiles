# SwayIdle — Automated Screen Lock & DPMS Power Saver
{ pkgs, ... }:
{
  services.swayidle = {
    enable = true;
    timeouts = [
      {
        timeout = 300; # 5 minutes
        command = "${pkgs.swaylock}/bin/swaylock -f";
      }
      {
        timeout = 600; # 10 minutes
        command = "${pkgs.sway}/bin/swaymsg \"output * dpms off\"";
        resumeCommand = "${pkgs.sway}/bin/swaymsg \"output * dpms on\"";
      }
    ];
    events = {
      before-sleep = "${pkgs.swaylock}/bin/swaylock -f";
      lock         = "${pkgs.swaylock}/bin/swaylock -f";
    };
  };
}
