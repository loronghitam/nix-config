{pkgs, ...}: {
  virtualisation = {
    virtualbox = {
      host = {
        enable = true;
        package = pkgs.virtualbox;
      };
      guest = {
        enable = true;
      };
    };
  };
}
