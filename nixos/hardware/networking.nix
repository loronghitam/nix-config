{lib, ...}: {
  networking.firewall = {
    allowedTCPPorts = [80 443];
    allowedUDPPortRanges = [
      {
        from = 40000;
        to = 50000;
      }
    ];
  };

  networking = {
    hostName = "nixos";
    networkmanager = {
      enable = true;
      wifi = {
        backend = "iwd";
        scanRandMacAddress = false;
        # perbaikan wifi yang kurang optimal
        powersave = false;
      };
      # https://search.nixos.org/options?channel=24.05&show=networking.networkmanager.wifi.macAddress&from=0&size=50&sort=relevance&type=packages&query=macAddress
      # macAddress = "preserve";
    };
    interfaces.enp3s0f3u1c2 = {
      useDHCP = lib.mkDefault true;
    };
    # defaultGateway = "192.168.100.1"; # Sesuaikan dengan gateway router Anda
    # nameservers = ["8.8.8.8" "8.8.4.4"]; # DNS server
    wireless = {
      iwd = {
        enable = true;
        settings = {
          IPv6 = {
            Enabled = true;
          };
          Settings = {
            AutoConnect = true;
          };
        };
      };
    };
  };
}
