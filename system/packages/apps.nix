{ pkgs, ... }:
{
  programs = {
    firefox.enable = false;   # using google-chrome and zen-browser instead
    thunderbird.enable = true;
  };

  environment.systemPackages = with pkgs; [
    # Browsers
    google-chrome

    # Communication
    telegram-desktop
    caprine
    zoom-us

    # Shell prompt theme
    zsh-powerlevel10k
  ];
}
