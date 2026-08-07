{ pkgs, ... }:
{
  # System-wide git configuration
  programs.git = {
    enable = true;
    prompt.enable = true;
    lfs.enable = true;
    config.init.defaultBranch = "main";
  };

  environment.systemPackages = with pkgs; [
    # Version control
    git
    git-lfs

    # CLI utilities
    ripgrep
    vim
    neovim
    wget
    curl
    htop
    btop
    pciutils
    lsd
    viu
    fd
    bat
    jq

    # ASCII / terminal art
    fastfetch
    pipes
    cbonsai
    cowsay
    figlet
    toilet
    lolcat
    peaclock
    cava
    cmatrix
    pipes-rs
    rsclock
  ];
}
