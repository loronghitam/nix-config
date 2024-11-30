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
  ];

  programs.fish.enable = true;

  programs.nix-index-database = {
    comma = {
      enable = true;
    };
  };

  programs.nix-index.enableBashIntegration = true;

  system.stateVersion = "unstable";

  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 4d --keep 3";
    flake = "/home/muggle/nix-config";
  };

  home-manager.backupFileExtension = "backup";
}
