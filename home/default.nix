{pkgs, ...}: {
  imports = [
    ./applications
    ./development
    ./packages
    ./shell
  ];

  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
    };
  };

  fonts.fontconfig.enable = true;

  home = {
    username = "muggle";
    homeDirectory = "/home/muggle";
    packages = with pkgs; [
      oh-my-fish
      eza
      (pkgs.nerdfonts.override {fonts = ["FiraCode"];})
    ];
  };

  home.stateVersion = "24.11";

  programs.home-manager.enable = true;

  home.sessionVariables = {
    EDITOR = "nvim";
  };
}
