{ ... }:
{
  networking = {
    hostName = "miskat";
    networkmanager.enable = true;
    enableIPv6 = true;

    firewall = {
      enable = true;
      allowPing = true;
      allowedTCPPorts = [ 22 80 443 8080 8888 ];
      trustedInterfaces = [ "lo" "docker0" ];
    };
  };

  systemd.network.wait-online.enable = true;
}
