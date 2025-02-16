{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./hardware
    ./common/desktop
    ./common/audio
    ./common/powermanagement
    ./common/users
    ./common/direnv
    ./common/security
    ./common/virtualization
    ./common/global/i18n.nix
    ./common/global/time.nix
    ./common/steam
  ];

  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
    };
  };

  environment.systemPackages = with pkgs; [
    cachix
    comma
    devenv
    anki
  ];

  programs.fish.enable = true;

  programs.nix-index-database = {
    comma = {
      enable = true;
    };
  };

  programs.nix-index.enableBashIntegration = true;

  system.stateVersion = "25.05";

  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 4d --keep 3";
    flake = "/home/muggle/nix-config";
  };

  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
  };

  programs.winbox = {
    enable = true;
    openFirewall = true;
  };

  home-manager.backupFileExtension = "home-manager.bak";
}
