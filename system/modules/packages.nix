{inputs, config, pkgs, ...}: {
  programs = {
    firefox.enable = true;

    sniffnet.enable = true;
    
    wireshark = {
      enable = true;
      package = pkgs.wireshark;
      dumpcap.enable = true;
      usbmon.enable = true;
    };

    thunderbird.enable = true;
  };

  environment.systemPackages = with pkgs; [
    #Cyber
    bettercap
    ciscoPacketTracer8
    netcat-gnu
    hping
    burpsuite
    wireshark
    sniffnet
    nmap
    tcpdump
    hashcat
    aircrack-ng
  
    ripgrep 
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
    caprine

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




    simulide_1_2_0
    arduino-ide

    # Cp
    pypy3
    clang-tools
    gcc
    libgccjit
    libclang
    clang

    # Diagrams
    graphviz
  ];
}
