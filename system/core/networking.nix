# Secure & High-Performance Network Subsystem (Firewall + TCP BBR + DNS over TLS)
{ ... }:
{
  networking = {
    hostName = "miskat";
    useDHCP = false;         # Disable global DHCP to prevent request loops with NetworkManager
    networkmanager = {
      enable = true;
      wifi.powersave = false;  # Disable Wi-Fi power saving to eliminate wake-up latency spikes
    };
    enableIPv6 = false;        # Disable IPv6 to prevent AAAA lookup timeout delays on IPv4-only WAN

    # Strict Stateful NixOS Firewall
    firewall = {
      enable = true;
      allowPing = false;              # Stealth mode against port scanners
      allowedTCPPorts = [ 22 80 443 ];  # SSH, HTTP, HTTPS
      allowedUDPPorts = [ 53 443 ];   # DNS, QUIC / HTTP3
      trustedInterfaces = [ "lo" "docker0" ];
      checkReversePath = "loose";     # Anti-spoofing protection
    };
  };

  # Network Security & Speed Kernel Parameters (TCP BBR + SYN Flood Protection)
  boot.kernel.sysctl = {
    "net.core.default_qdisc" = "fq";
    "net.ipv4.tcp_congestion_control" = "bbr";
    "net.ipv4.tcp_fastopen" = 3;
    "net.ipv4.tcp_syncookies" = 1;
    "net.ipv4.conf.all.rp_filter" = 1;
    "net.ipv4.conf.default.rp_filter" = 1;
    "net.ipv4.icmp_echo_ignore_broadcasts" = 1;
  };

  # Fast, Encrypted Local DNS Caching via systemd-resolved (DNS over TLS)
  services.resolved = {
    enable = true;
    settings = {
      Resolve = {
        DNSOverTLS = "true";
        DNSSEC = "true";
        DNS = [ "1.1.1.1#cloudflare-dns.com" "1.0.0.1#cloudflare-dns.com" ];
        FallbackDNS = [ "9.9.9.9#dns.quad9.net" "149.112.112.112#dns.quad9.net" ];
        Domains = [ "~." ];
      };
    };
  };

  # Disable wait-online services to eliminate boot delays
  systemd.network.wait-online.enable = false;
  systemd.services.NetworkManager-wait-online.enable = false;
}
