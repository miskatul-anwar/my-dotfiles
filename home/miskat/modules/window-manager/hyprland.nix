{inputs,...}:{
  programs.kitty.enable = true;

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;

    settings = {
      "$mainMod" = "SUPER";

      monitor = ",1920x1080@90,auto,1";

      plugins = [
      ];
    };
  };
}
