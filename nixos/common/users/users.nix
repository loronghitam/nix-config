{
  pkgs,
  userSettings,
  ...
}: {
  users = {
    defaultUserShell = pkgs.fish;
    extraGroups = {
      vboxusers = {
        members = [userSettings.username];
      };
    };
    users.muggle = {
      isNormalUser = true;
      extraGroups = ["wheel" "audio" "networkmanager" "vboxusers"];
      uid = 1000;
      packages = with pkgs; [
        git
        home-manager
      ];
    };
  };
}
