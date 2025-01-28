{
  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        ignore_empty_input = true;
        disable_loading_bar = true;
        # grace = 300;
        hide_cursor = true;
        no_fade_in = false;
      };

      background = [
        {
          path = "screenshot";
          blur_passes = 3;
          blur_size = 8;
        }
      ];

      label = {
      };

      input-field = [
        {
          monitor = "";
          size = "300, 60";
          outline_thickness = 2;
          # dot_size = 0.2;
          dots_spacing = 0.2;
          dots_center = true;
          outer_color = "rgba(255, 255, 255, 0)";
          inner_color = "rgba(255, 255, 255, 0.1)";
          font_color = "rgb(200, 200, 200)";
          fade_on_empty = false;
          placeholder_text = ''<i><span foreground="##ffffff99">🔒 Enter Pass</span></i>'';
          hide_input = false;
          position = "0, -250";
          halign = "center";
          valign = "center";
        }
      ];
    };
  };
}
