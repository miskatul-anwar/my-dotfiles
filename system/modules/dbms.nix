{config, pkgs, ...}: {
  services.mysql = {
    enable = true;
    package = pkgs.mariadb;
    dataDir = "/var/lib/mysql";
    ensureDatabases=["HR"];
    ensureUsers = [
      {
        name = "miskat";
        ensurePermissions = {
          "HR.*" = "ALL PRIVILEGES";
        };
      }
    ];
  };
  environment.systemPackages = with pkgs; [ dbeaver-bin ];
}
