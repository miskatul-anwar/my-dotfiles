{config, pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    vim lunarvim wget curl google-chrome zsh-powerlevel10k ghostty pciutils zoom-us libgccjit rustup 
  ];
}
