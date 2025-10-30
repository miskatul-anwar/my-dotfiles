{ config, pkgs, ... }:

{
  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
    enableIPv6 = true;

    firewall = {
      enable = true;
      allowPing = true;
      allowedTCPPorts = [ 22 80 443 8888 ];
      trustedInterfaces = [ "lo" "docker0" ];

      # You no longer need manual iptables commands;
      # NixOS firewall manages Docker bridges automatically
    };
  };

  # Wait for full connectivity before starting services
  systemd.network.wait-online.enable = true;
}
