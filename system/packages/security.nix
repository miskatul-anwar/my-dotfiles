{ pkgs, ... }:
{
  programs = {
    wireshark = {
      enable = true;
      package = pkgs.wireshark;
      dumpcap.enable = true;
      usbmon.enable = true;
    };
    sniffnet.enable = true;
  };

  environment.systemPackages = with pkgs; [
    # Packet / traffic analysis
    wireshark
    sniffnet
    nmap
    tcpdump
    netcat-gnu
    hping

    # Offensive / testing tools
    bettercap
    burpsuite
    aircrack-ng
    hashcat
  ];
}
