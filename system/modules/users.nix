{config, pkgs, ...}:{
  programs.zsh.enable = true;

  users.users.miskat = {
    isNormalUser = true;
    description = "Miskatul Anwar";
    extraGroups = ["networkmanager" "wheel" "docker" "wireshark" "sniffnet"];
    shell = pkgs.zsh;
    packages = with pkgs; [ ];
  };
}

