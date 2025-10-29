{inputs, config, pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    vim 
    lunarvim 
    wget 
    curl 
    google-chrome 
    zsh-powerlevel10k 
    ghostty 
    pciutils 
    zoom-us 
    libgccjit 
    rustup 
    lsd 
    gnumake 
    gdb 
    gef 
    binutils 
    gcc 
    texliveFull
    telegram-desktop

    # Python
    python312
    python312Packages.jupyter
    python312Packages.matplotlib
    python312Packages.manim
    python312Packages.scipy
    python312Packages.sympy
  ];
}
