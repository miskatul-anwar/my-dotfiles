{...}:{
  system.autoUpgrade ={
    enable = true;
    operation = "switch";
    flake = "/home/miskat/nixos/";
    dates = "weekly";
  };
}
