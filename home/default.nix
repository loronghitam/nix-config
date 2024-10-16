{ config, pkgs, ... }:

{
  home.username = "muggle";
  home.homeDirectory = "/home/muggle";

  home.packages = with pkgs; [
    tree
  ];

  programs.git = {
    enable = true;
    userName = "loronghitam";
    userEmail = "sutio.mudiarno@gmail.com";
  };

  home.stateVersion = "24.05";

  programs.home-manager.enable = true;
}
