{config, pkgs, ...}:{
  programs.hyprland = {
    enable = true;
  };
  environment.systemPackages = with pkgs; [
    # Terminal
    kitty 
  ];
}
