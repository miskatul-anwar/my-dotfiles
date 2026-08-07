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
    # Version control & GitHub AI
    git
    git-lfs
    gh
    github-copilot-cli

    # CLI utilities & Process/GPU Monitors
    ripgrep
    vim
    wget
    curl
    htop
    btop
    nvtopPackages.full
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
