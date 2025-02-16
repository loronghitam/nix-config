{
  pkgs,
  inputs,
  systemSettings,
  ...
}: {
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
      # prisma
      # prisma-engines
      inputs.zen-browser.packages."${systemSettings.system}".default
    ];
  };

  home.stateVersion = "25.05";

  programs.home-manager.enable = true;

  home.sessionVariables = {
    PRISMA_SCHEMA_ENGINE_BINARY = "${pkgs.prisma-engines}/bin/schema-engine";
    PRISMA_QUERY_ENGINE_BINARY = "${pkgs.prisma-engines}/bin/query-engine";
    PRISMA_QUERY_ENGINE_LIBRARY = "${pkgs.prisma-engines}/lib/libquery_engine.node";
    PRISMA_FMT_BINARY = "${pkgs.prisma-engines}/bin/prisma-fmt";

    EDITOR = "nvim";
  };
}
