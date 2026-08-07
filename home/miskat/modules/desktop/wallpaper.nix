# Static Dracula NixOS Wallpaper Provider
{ pkgs, ... }:
let
  set-wallpaper-script = pkgs.writeShellScriptBin "set-wallpaper" ''
    #!/usr/bin/env bash
    set -euo pipefail

    WP_FILE="$HOME/Pictures/Wallpapers/nixos-dracula.png"

    if [ -f "$WP_FILE" ]; then
      ${pkgs.awww}/bin/awww img "$WP_FILE" --transition-type outer --transition-step 90 --transition-fps 60 || true
    fi
  '';
in
{
  home.packages = [
    set-wallpaper-script
  ];

  # Set static wallpaper once at graphical session startup (No automatic switching)
  systemd.user.services.set-wallpaper = {
    Unit = {
      Description = "Set static Dracula NixOS wallpaper";
      After = [ "graphical-session.target" ];
    };
    Service = {
      ExecStart = "${set-wallpaper-script}/bin/set-wallpaper";
      Type = "oneshot";
    };
    Install = {
      WantedBy = [ "graphical-session.target" ];
    };
  };
}
