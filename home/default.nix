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

  home = {
    username = "muggle";
    homeDirectory = "/home/muggle";
    packages = with pkgs; [
      oh-my-fish
      eza
    ];
  };

  home.stateVersion = "24.11";

  programs.home-manager.enable = true;

  home.sessionVariables = {
    EDITOR = "nvim";
    NIXOS_OZONE_WL = "1";
  };
}
