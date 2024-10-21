{pkgs, ...}: {
  home.packages = with pkgs; [
    php82
    php82Packages.composer
  ];
}
