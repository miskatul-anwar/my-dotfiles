{config, pkgs, ...}:{
  programs.hyprland = {
    enable = true;
  };
  # environment.systemPackages = with pkgs; [
  #   # terminal, wayland tools, and UI
  #   kitty
  #   alacritty
  #   waybar
  #   swww          # animated wallpaper daemon (confirmed in Nixpkgs)
  #   pamixer       # for volume control (confirmed in Nixpkgs)

  #   # clipboard & screenshots
  #   wl-clipboard  # provides wl-paste / wl-copy
  #   slurp
  #   grim
  #   swappy

  #   # launchers and menus
  #   wofi
  #   cliphist      # verify existence or replace with your clip history tool

  #   # file manager and control utilities
  #   dolphin
  #   pavucontrol
  #   brightnessctl

  #   # basic utilities
  #   procps       # provides free, pkill, etc.
  #   python3      # for custom/weather wttr.py script
  # ];
}
