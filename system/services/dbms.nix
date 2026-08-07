# MariaDB / DBMS — disabled by default, uncomment in system/default.nix to enable
{ pkgs, ... }:
{
  services.mysql = {
    enable = true;
    package = pkgs.mariadb;
    dataDir = "/var/lib/mysql";
    ensureDatabases = [ "HR" "BOOKSTORE" ];
    ensureUsers = [
      {
        name = "miskat";
        ensurePermissions = {
          "HR.*"        = "ALL PRIVILEGES";
          "BOOKSTORE.*" = "ALL PRIVILEGES";
        };
      }
    ];
  };

  environment.systemPackages = with pkgs; [ dbeaver-bin ];
}
