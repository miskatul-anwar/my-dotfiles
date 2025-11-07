{inputs,pkgs,...}:{
  programs.niri.enable = true;
  environment.systemPackages = with pkgs;[
    quickshell
    caelestia-shell.packages.${system}.default
    fuzzel
    alacritty
    swaybg
    xwayland-satellite
  ];
}
