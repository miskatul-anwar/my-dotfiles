{ pkgs, ... }:
{
  boot.kernelModules = [ "kvm" "kvm_intel" "kvm_amd" ];

  users.extraGroups.kvm.members     = [ "miskat" ];
  users.extraGroups.libvirtd.members = [ "miskat" ];

  virtualisation.libvirtd = {
    enable = true;
    qemu.runAsRoot = true;
  };

  environment.systemPackages = with pkgs; [
    winboat
    gnome-boxes
  ];
}
