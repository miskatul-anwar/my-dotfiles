{inputs, config, pkgs, ...}: {
  programs.firefox.enable = true;

  environment.systemPackages = with pkgs; [
    ripgrep 
    clang-tools
    gcc
    libgccjit
    viu
    vim 
    lunarvim 
    wget 
    curl 
    google-chrome 
    zsh-powerlevel10k 
    ghostty 
    pciutils 
    zoom-us 
    rustup 
    lsd 
    # binutils 
    texliveFull
    # social media
    telegram-desktop

    # Python
    python312
    python312Packages.ipykernel       # Python kernel for Jupyter
    python312Packages.notebook         # classic Jupyter Notebook
    python312Packages.jupyterlab       # modern interface (optional)
    python312Packages.numpy
    python312Packages.pandas
    python312Packages.matplotlib
    python312Packages.scipy
    python312Packages.seaborn


    # clang
    libclang
    clang
  ];
}
