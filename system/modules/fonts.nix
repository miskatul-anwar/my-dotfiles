{pkgs, ...}: {
  fonts.packages = with pkgs; [
    jetbrains-mono
    nerd-font-patcher
    noto-fonts-color-emoji
    nerd-fonts.envy-code-r
    nerd-fonts.droid-sans-mono
    nerd-fonts.jetbrains-mono
    nerd-fonts.caskaydia-cove
  ];
}
