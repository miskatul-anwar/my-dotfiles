{inputs,pkgs,...}:{
  programs.niri.enable = true;
  environment.systemPackages = with pkgs;[
    eyedropper
    inputs.quickshell.packages.${system}.default
    inputs.noctalia.packages.${system}.default
    fuzzel
    rofi
    alacritty
    swaybg
    xwayland-satellite
  ];
}
