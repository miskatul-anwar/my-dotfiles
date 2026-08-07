# Anime Wallpaper Cycler — rotates downloaded local wallpapers from ~/Pictures/Wallpapers/
{ pkgs, ... }:
let
  anime-wallpaper-script = pkgs.writeShellScriptBin "anime-wallpaper" ''
    #!/usr/bin/env bash
    set -euo pipefail

    WP_DIR="$HOME/Pictures/Wallpapers"
    mkdir -p "$WP_DIR"

    # Find all downloaded image wallpapers
    mapfile -t WALLPAPERS < <(find "$WP_DIR" -type f \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.webp" \) 2>/dev/null)

    if [ ''${#WALLPAPERS[@]} -gt 0 ]; then
      # Pick a random wallpaper from local collection
      RANDOM_WP="''${WALLPAPERS[$RANDOM % ''${#WALLPAPERS[@]}]}"

      # Apply wallpaper via awww daemon with smooth transition
      ${pkgs.awww}/bin/awww img "$RANDOM_WP" --transition-type outer --transition-step 90 --transition-fps 60 || true
    fi
  '';
in
{
  home.packages = [
    anime-wallpaper-script
  ];

  # Systemd user timer: rotates local anime wallpapers every 30 minutes
  systemd.user.services.anime-wallpaper = {
    Unit = {
      Description = "Rotate local anime wallpapers";
      After = [ "graphical-session.target" ];
    };
    Service = {
      ExecStart = "${anime-wallpaper-script}/bin/anime-wallpaper";
      Type = "oneshot";
    };
  };

  systemd.user.timers.anime-wallpaper = {
    Unit = {
      Description = "Rotate local anime wallpapers every 30 minutes";
    };
    Timer = {
      OnBootSec = "5s";
      OnUnitActiveSec = "30min";
    };
    Install = {
      WantedBy = [ "timers.target" ];
    };
  };
}
