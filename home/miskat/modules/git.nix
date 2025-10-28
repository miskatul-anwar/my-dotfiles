{config, pkgs,...}:{
  programs.git = {
    enable = true;
    settings.user = {
      name = "Miskatul Anwar";
      email = "miskatul.anwar.csecu@gmail.com";
    };
  };
}
