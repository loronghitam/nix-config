{
  catppuccin = {
    alacritty.enable = true;
  };

  programs.alacritty = {
    enable = true;
    settings = {
      env = {
        "TERM" = "xterm-256color";
      };
      font.bold = {
        family = "JetBrainsMono Nerd Font";
        style = "Bold";
      };
      font.bold_italic = {
        family = "JetBrainsMono Nerd Font";
        style = "Bold Italic";
      };
      font.italic = {
        family = "JetBrainsMono Nerd Font";
        style = "Italic";
      };
      font.normal = {
        family = "JetBrainsMono Nerd Font";
        style = "Reguler";
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
