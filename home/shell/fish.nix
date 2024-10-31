{pkgs, ...}: {
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting # Disable greeting
    '';
    shellAbbrs = {
      nrs = "sudo nixos-rebuild switch --flake ~/nix-config/";
    };
    shellInit = ''
      # direnv hook
      if status --is-interactive
        eval (direnv hook fish)
      end
    '';
  };
}
