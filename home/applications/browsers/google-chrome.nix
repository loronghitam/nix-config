{pkgs, ...}: {
  programs.google-chrome = {
    enable = true;
  };
  #  environment.systemPackages = with pkgs; [
  #    google-chrome
  #  ];
}
