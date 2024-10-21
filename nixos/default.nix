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

  time.timeZone = "Asia/Jakarta";

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    helix
    wget
    nixd
    nixpkgs-fmt
    cachix
  ];

  system.stateVersion = "unstable";
}
