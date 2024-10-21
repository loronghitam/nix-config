{
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
