{
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
      colors = {
        primary = {
          background = "0x282828";
          foreground = "0xebdbb2";
        };
        normal = {
          black = "0x282828";
          red = "0xcc241d";
          green = "0x98971a";
          yellow = "0xd79921";
          blue = "0x458588";
          magenta = "0xb16286";
          cyan = "0x689d6a";
          white = "0xa89984";
        };
        bright = {
          black = "0x928374";
          red = "0xfb4934";
          green = "0xb8bb26";
          yellow = "0xfabd2f";
          blue = "0x83a598";
          magenta = "0xd3869b";
          cyan = "0x8ec07c";
          white = "0xebdbb2";
        };
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
