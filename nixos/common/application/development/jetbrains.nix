{ pkgs, ... }: {
  environment.systemPackages = with pkgs.jetbrains; [
    phpstorm
    pycharm-professional
    idea-ultimate
    jdk
    webstorm
  ];
}
