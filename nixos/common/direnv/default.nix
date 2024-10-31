{
  programs.direnv = {
    enable = true;
    silent = true;
    nix-direnv.enable = true;
    enableBashIntegration = false;
    enableFishIntegration = true;
  };
}
