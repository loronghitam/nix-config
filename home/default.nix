{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./applications
    ./development
    ./packages
    ./shell
  ];
  home.username = "muggle";
  home.homeDirectory = "/home/muggle";

  home.packages = with pkgs; [
  ];

  home.stateVersion = "24.11";

  programs.home-manager.enable = true;
}
