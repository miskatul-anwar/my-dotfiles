{pkgs,...}:{
  services.flatpak.enable = true;

  systemd.services.flatpak-repo = {
    description = "Add Flathub repository for Flatpak";
    wantedBy = [ "multi-user.target" ];
    path = [ pkgs.flatpak ];
    script = ''
      flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    '';
  };

  environment.systemPackages = with pkgs; [
    flatpak-builder
  ];
}
