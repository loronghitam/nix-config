{pkgs, ...}: {
  imports = [
    ./hardware
    #    ./common/application/development
    #    ./common/application/browsers
    ./common/desktop
    ./common/audio
    ./common/powermanagement
    ./common/users
    ./common/virtualization
  ];

  # TODO: Rapihkan

  time.timeZone = "Asia/Jakarta";

  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "id_ID.UTF-8";
    LC_IDENTIFICATION = "id_ID.UTF-8";
    LC_MEASUREMENT = "id_ID.UTF-8";
    LC_MONETARY = "id_ID.UTF-8";
    LC_NAME = "id_ID.UTF-8";
    LC_NUMERIC = "id_ID.UTF-8";
    LC_PAPER = "id_ID.UTF-8";
    LC_TELEPHONE = "id_ID.UTF-8";
    LC_TIME = "id_ID.UTF-8";
  };

  nixpkgs.config.allowUnfree = true;

  # TODO: Rapihkan
  environment.systemPackages = with pkgs; [
    helix
    wget
    nixd
    nixpkgs-fmt
    cachix
    cowsay
    comma
    devenv
  ];

  # TODO: Rapihkan
  programs.direnv = {
    enable = true;
    silent = true;
    nix-direnv.enable = true;
    enableBashIntegration = false;
    enableFishIntegration = true;
  };
  # TODO: Rapihkan

  programs.nix-index-database = {
    comma = {
      enable = true;
    };
  };
  programs.nix-index.enableBashIntegration = true;

  system.stateVersion = "unstable";
}
