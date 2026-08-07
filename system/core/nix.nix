{ pkgs, ... }:
{
  # Flakes + new CLI
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Store optimisation
  nix.settings.auto-optimise-store = true;
  nix.optimise.automatic = true;

  # Garbage collection — managed by programs.nh.clean below (nix.gc.automatic disabled to avoid conflict)
  nix.gc = {
    automatic = false; # nh.clean handles scheduling; set true here only if disabling nh.clean
    dates = "weekly";
    options = "--delete-older-than 14d";
  };

  # Auto-upgrade (weekly)
  system.autoUpgrade = {
    enable = true;
    operation = "switch";
    flake = "/home/miskat/my-dotfiles";
    dates = "weekly";
  };

  # nh — ergonomic Nix helper
  programs.nh = {
    enable = true;
    clean = {
      enable = true;
      extraArgs = "--keep-since 7d --keep 5";
    };
    flake = "/home/miskat/my-dotfiles";
  };

  environment.systemPackages = with pkgs; [
    nix-output-monitor # coloured build output
    nvd               # diff between system generations
  ];
}
