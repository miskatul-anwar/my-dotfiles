{config, pkgs, ...}: {
  services.xserver.displayManager.lightdm.enable = true;
  services.desktopManager.pantheon.enable = true;
}
