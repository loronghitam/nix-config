{
  lib,
  pkgs,
  ...
}: {
  programs.fish = {
    enable = true;
    shellAbbrs = {
      nrs = "sudo nixos-rebuild switch --flake ~/nix-config/";
    };
    # interactiveShellInit = lib.mkAfter ''
    #   ${pkgs.direnv} hook fish | source
    # '';
  };
}
