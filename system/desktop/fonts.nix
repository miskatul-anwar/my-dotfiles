{ pkgs, ... }:
{
  # Consolidated & deduplicated font list
  fonts.packages = with pkgs; [
    # Base / UI fonts
    noto-fonts
    noto-fonts-color-emoji
    dejavu_fonts
    liberation_ttf
    ubuntu-classic
    inter
    jetbrains-mono
    lohit-fonts.bengali

    # Nerd Fonts (terminal / coding)
    nerd-font-patcher
    nerd-fonts.envy-code-r
    nerd-fonts.droid-sans-mono
    nerd-fonts.jetbrains-mono
    nerd-fonts.caskaydia-cove
    nerd-fonts.hack
    nerd-fonts.fira-code
    nerd-fonts.sauce-code-pro
    nerd-fonts.dejavu-sans-mono
    nerd-fonts.iosevka
    nerd-fonts.ubuntu
    nerd-fonts.roboto-mono
    nerd-fonts.mononoki
    nerd-fonts.inconsolata
    nerd-fonts.victor-mono
    nerd-fonts.space-mono
    nerd-fonts.profont
  ];
}
