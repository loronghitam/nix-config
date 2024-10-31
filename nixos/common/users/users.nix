{pkgs, ...}: {
  users = {
    defaultUserShell = pkgs.fish;
    extraGroups = {
      vboxusers = {
        members = ["muggle"];
      };
    };
    users.muggle = {
      isNormalUser = true;
      extraGroups = ["wheel" "audio" "networkmanager" "vboxusers"];
      packages = with pkgs; [
        git
        zellij
        home-manager
      ];
    };
  };
}
