# Automatic Anime Wallpaper provider service using Wallhaven API + awww daemon
{ pkgs, ... }:
let
  anime-wallpaper-script = pkgs.writeShellScriptBin "anime-wallpaper" ''
    #!/usr/bin/env bash
    set -euo pipefail

    WP_DIR="$HOME/.cache/wallpapers"
    mkdir -p "$WP_DIR"
    WP_FILE="$WP_DIR/current_anime.jpg"

    # Query Wallhaven API for high-resolution anime wallpapers
    IMG_URL=$(${pkgs.curl}/bin/curl -s "https://wallhaven.cc/api/v1/search?categories=010&purity=100&sorting=random" | ${pkgs.jq}/bin/jq -r '.data[0].path' 2>/dev/null || true)

    if [ -n "$IMG_URL" ] && [ "$IMG_URL" != "null" ]; then
      ${pkgs.curl}/bin/curl -s "$IMG_URL" -o "$WP_FILE"
      # Set wallpaper via awww daemon with smooth transition
      ${pkgs.awww}/bin/awww img "$WP_FILE" --transition-type outer --transition-step 90 --transition-fps 60 || true
    fi
  '';
in
{
  home.packages = [
    anime-wallpaper-script
  ];

  # Systemd user timer: rotates anime wallpaper every 30 minutes
  systemd.user.services.anime-wallpaper = {
    Unit = {
      Description = "Fetch and set random anime wallpaper";
      After = [ "graphical-session.target" ];
    };
    Service = {
      ExecStart = "${anime-wallpaper-script}/bin/anime-wallpaper";
      Type = "oneshot";
    };
  };

  systemd.user.timers.anime-wallpaper = {
    Unit = {
      Description = "Rotate anime wallpaper every 30 minutes";
    };
    Timer = {
      OnBootSec = "10s";
      OnUnitActiveSec = "30min";
    };
    Install = {
      WantedBy = [ "timers.target" ];
    };
  };
}
