{pkgs, ...}: {
  imports = [
    ./hardware
    ./common/desktop
    ./common/audio
    ./common/powermanagement
    ./common/users
    ./common/direnv
    ./common/virtualization
    ./common/global/i18n.nix
    ./common/global/time.nix
  ];

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    helix
    wget
    nixd
    nixpkgs-fmt
    cachix
    cowsay
    comma
    devenv
    fish
  ];
  programs.fish.enable = true;

  programs.nix-index-database = {
    comma = {
      enable = true;
    };
  };

  programs.nix-index.enableBashIntegration = true;

  system.stateVersion = "unstable";
}
