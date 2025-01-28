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
      openssl
      prisma
      prisma-engines
    ];
  };

  home.stateVersion = "24.11";

  programs.home-manager.enable = true;

  home.sessionVariables = {
    PRISMA_SCHEMA_ENGINE_BINARY = "${pkgs.prisma-engines}/bin/schema-engine";
    PRISMA_QUERY_ENGINE_BINARY = "${pkgs.prisma-engines}/bin/query-engine";
    PRISMA_QUERY_ENGINE_LIBRARY = "${pkgs.prisma-engines}/lib/libquery_engine.node";
    PRISMA_FMT_BINARY = "${pkgs.prisma-engines}/bin/prisma-fmt";

    EDITOR = "nvim";

    # NIXOS_OZONE_WL = "1";
    # MOZ_ENABLE_WAYLAND = "1";
    #
    # QT_QPA_PLATFORM = "wayland";
    # GDK_BACKEND = "wayland";
    # XDG_CURRENT_DESKTOP = "Hyprland";
    # XDG_SESSION_TYPE = "wayland";
    # _JAVA_AWT_WM_NONREPARENTING = "1";
    # CLUTTER_BACKEND = "wayland";
    # SDL_VIDEODRIVER = "wayland";
  };
}
