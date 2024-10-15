{ pkgs, ... }: {
  environment.systemPackages = with pkgs.jetbrains; [
    idea-ultimate
    jdk
    webstorm
  ];
}
