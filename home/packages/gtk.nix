{pkgs, ...}: {
  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    nerd-fonts.fira-code
    nerd-fonts.symbols-only
    maple-mono
  ];

  # gtk = {
  #   enable = true;
  #   cursorTheme = {
  #     name = "Bibata-Modern-Ice";
  #     package = pkgs.bibata-cursors;
  #     size = 24;
  #   };
  # };
  #
  # home.pointerCursor = {
  #   name = "Bibata-Modern-Ice";
  #   package = pkgs.bibata-cursors;
  #   size = 24;
  # };
}
