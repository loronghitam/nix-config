{pkgs, ...}: {
  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
  };

  programs.fish = {
    enable = true;

    interactiveShellInit = ''
      set fish_greeting # Disable greeting
    '';

    shellAbbrs = {
      nrs = "sudo nixos-rebuild switch --flake ~/nix-config/";
      ls = "eza --color=always --long --no-filesize --icons=always --no-time --no-user --no-permissions";
      ll = "eza --icons=always --long";

      # podman
      dcu = "podman-compose up -d";
      dcd = "podman-compose down";
    };

    shellInit = ''
      # direnv hook
      if status --is-interactive
        eval (direnv hook fish)
      end
    '';
  };
}
