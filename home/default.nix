{pkgs, ...}: {
  imports = [
    ./applications
    ./development
    ./packagese
    ./shell
  ];
  home = {
    username = "muggle";
  };
  home.homeDirectory = "/home/muggle";

  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    grc
    libnotify
    (pkgs.nerdfonts.override {fonts = ["FiraCode"];})
  ];

  home.stateVersion = "24.11";

  programs.home-manager.enable = true;
}
