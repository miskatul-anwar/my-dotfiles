{config,pkgs,...}: {
  environment.systemPackages = with pkgs; [ 
    winboat 
    gnome-boxes
  ];
  boot.kernelModules = ["kvm" "kvm_intel" "kvm_amd"];
  users.extraGroups.kvm.members = ["miskat"];
  virtualisation.libvirtd ={
    enable = true;
    qemu.runAsRoot = true;
  };
  users.extraGroups.libvirtd.members = ["miskat"];
}
