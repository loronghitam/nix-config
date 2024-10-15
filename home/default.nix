{ config, pkgs, ... }:

{
  # TODO please change the username & home directory to your own
  home.username = "muggle";
  home.homeDirectory = "/home/muggle";

  # link the configuration file in current directory to the specified location in home directory
  # home.file.".config/i3/wallpaper.jpg".source = ./wallpaper.jpg;

  # link all files in `./scripts` to `~/.config/i3/scripts`
  # home.file.".config/i3/scripts" = {
  #   source = ./scripts;
  #   recursive = true;   # link recursively
  #   executable = true;  # make all files executable
  # };

  # encode the file content in nix configuration file directly
  # home.file.".xxx".text = ''
  #     xxx
  # '';

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
  ];

  # basic configuration of git, please change to your own
  programs.git = {
    enable = true;
    userName = "loronghitam";
    userEmail = "sutio.mudiarno@gmail.com";
  };

  home.stateVersion = "24.05";

  programs.home-manager.enable = true;
}
