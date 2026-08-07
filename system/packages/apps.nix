{ pkgs, ... }:
{
  programs = {
    firefox.enable = false;   # using google-chrome and zen-browser instead
    thunderbird.enable = true;
  };

  environment.systemPackages = with pkgs; [
    # Browsers (configured with Wayland Ozone & Vulkan to eliminate NVIDIA video flickering)
    (google-chrome.override {
      commandLineArgs = [
        "--enable-features=UseOzonePlatform,Vulkan,WaylandWindowDecorations"
        "--ozone-platform=wayland"
        "--ignore-gpu-blocklist"
        "--enable-gpu-rasterization"
        "--enable-zero-copy"
      ];
    })

    # Communication
    telegram-desktop
    caprine
    zoom-us

    # Shell prompt theme
    zsh-powerlevel10k
  ];
}
