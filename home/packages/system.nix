{pkgs, ...}: {
  home.packages = with pkgs; [
    ethtool
    lshw
  ];
}
