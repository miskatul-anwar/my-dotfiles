{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
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
