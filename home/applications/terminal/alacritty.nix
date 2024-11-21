{
  programs.alacritty = {
    enable = true;
    catppuccin = {
      enable = true;
    };
    settings = {
      env = {
        "TERM" = "xterm-256color";
      };
      window = {
        decorations = "buttonless";
        opacity = 0.8;
        blur = true;
        padding.x = 10;
        padding.y = 10;
      };
    };
  };
}
