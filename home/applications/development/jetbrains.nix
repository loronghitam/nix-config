{pkgs, ...}: {
  home.packages = with pkgs.jetbrains; [
    pycharm-professional
    phpstorm
    idea-ultimate
    webstorm
  ];
}
