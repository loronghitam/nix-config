{pkgs, ...}: {
  users = {
    extraGroups = {
      vboxusers = {
        members = ["muggle"];
      };
    };

    users.muggle = {
      isNormalUser = true;
      extraGroups = ["wheel" "audio" "networkmanager" "vboxusers"];
      uid = 1000;
      packages = with pkgs; [
        git
        zellij
        home-manager
      ];
    };
  };
}
