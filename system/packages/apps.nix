{ pkgs, ... }:
{
  programs = {
    firefox.enable = false;   # using google-chrome and zen-browser instead
    thunderbird.enable = true;
  };

  environment.systemPackages = with pkgs; [
    # Browsers (configured with Wayland Ozone & ANGLE GL backend for smooth NVIDIA video playback)
    (google-chrome.override {
      commandLineArgs = [
        "--ozone-platform=wayland"
        "--enable-features=UseOzonePlatform,WaylandWindowDecorations"
        "--use-angle=gl"
        "--enable-gpu-rasterization"
        "--enable-zero-copy"
      ];
    })

    # Communication
    telegram-desktop
    caprine
    zoom-us

    # Productivity & Media
    libreoffice-fresh
    vlc
    gimp
    flameshot
    filezilla
    transmission_4-gtk
    rhythmbox
    cheese
    shotwell
    simple-scan

    # System Utilities & Archiving
    p7zip
    gparted
    baobab

    # Shell prompt theme
    zsh-powerlevel10k
  ];
}
