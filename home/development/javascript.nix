{pkgs, ...}: {
  home.packages = with pkgs; [
    nodejs_20
    nest-cli
  ];
}
