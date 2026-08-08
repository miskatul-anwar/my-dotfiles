{ ... }:
{
  networking = {
    hostName = "miskat";
    networkmanager = {
      enable = true;
      wifi.powersave = false;  # Disable Wi-Fi power saving to eliminate wake-up latency spikes
    };
    enableIPv6 = false;        # Disable IPv6 to prevent AAAA lookup timeout delays on IPv4-only WAN

    firewall = {
      enable = true;
      allowPing = true;
      allowedTCPPorts = [ 22 80 443 8080 8888 ];
      trustedInterfaces = [ "lo" "docker0" ];
    };
  };

  # Fast local DNS caching via systemd-resolved (Cloudflare 1.1.1.1 & Google 8.8.8.8)
  services.resolved = {
    enable = true;
    settings = {
      Resolve = {
        DNSSEC = "false";
        Domains = [ "~." ];
        FallbackDNS = [ "1.1.1.1" "8.8.8.8" ];
      };
    };
  };

  systemd.network.wait-online.enable = true;
}
