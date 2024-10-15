{ config, lib, pkgs, inputs, ... }:

{
  imports =
    [
      ./hardware
      ./common/application/development
      ./common/application/browsers
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  time.timeZone = "Asia/Jakarta";

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;

  nixpkgs.config.allowUnfree = true;

  hardware.pulseaudio.enable = true;
  services.pipewire = {
    enable = false;
  };

  users.users.muggle = {
    isNormalUser = true;
    extraGroups = [ "wheel" "audio" "networkmanager" ];
    uid = 1000;
    packages = with pkgs; [
      git
      zellij
      home-manager
    ];
  };

  environment.systemPackages = with pkgs; [
    helix
    wget
    nixd
    nixpkgs-fmt
    cachix
  ];

  system.stateVersion = "24.05";

  nix = {
    nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];
    package = pkgs.nixFlakes;
    settings = {
      trusted-users = [ "root" "muggle" ];
      trusted-substituters = [
        "https://nix-community.cachix.org"
        "https://muggle.cachix.org/"
      ];
      trusted-public-keys = [
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        "muggle.cachix.org-1:J0PNtvTumj5Cy+t/RlQtWzRJEquJREBIprfNvshUKQw="
      ];
    };
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };
}
