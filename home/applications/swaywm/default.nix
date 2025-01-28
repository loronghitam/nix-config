{pkgs, ...}: {
  imports = [
    ./config/rofi.nix
    ./config/waybar.nix
  ];

  wayland.windowManager.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
    config = {
      output = {
        "eDP-1" = {
          mode = "1440x900@60Hz";
          position = "0,0";
          scale = "1";
        };
      };
      modifier = "Mod4";

      bars = [
        {command = "waybar";}
      ];

      terminal = "${pkgs.alacritty}/bin/alacritty";

      startup = [
        {command = "alacritty";}
      ];

      keybindings = let
        win = "Mod4";
      in {
        # rofi: menu
        "${win}+r" = "exec ${pkgs.rofi}/bin/rofi -show drun";

        "${win}+Return" = "exec ${pkgs.alacritty}/bin/alacritty";
        # rofi: bluetooth
        "${win}+q" = "kill";

        # workspace
        "${win}+1" = "workspace number 1";
        "${win}+2" = "workspace number 2";
        "${win}+3" = "workspace number 3";
        "${win}+4" = "workspace number 4";
        "${win}+5" = "workspace number 5";
        "${win}+6" = "workspace number 6";
        "${win}+7" = "workspace number 7";
        "${win}+8" = "workspace number 8";
        "${win}+9" = "workspace number 9";

        "${win}+Shift+1" = "move container to workspace number 1";
        "${win}+Shift+2" = "move container to workspace number 2";
        "${win}+Shift+3" = "move container to workspace number 3";
        "${win}+Shift+4" = "move container to workspace number 4";
        "${win}+Shift+5" = "move container to workspace number 5";
        "${win}+Shift+6" = "move container to workspace number 6";
        "${win}+Shift+7" = "move container to workspace number 7";
        "${win}+Shift+8" = "move container to workspace number 8";
        "${win}+Shift+9" = "move container to workspace number 9";

        #move
        "${win}+h" = "focus left";
        "${win}+j" = "focus down";
        "${win}+k" = "focus up";
        "${win}+l" = "focus right";

        "${win}+Shift+h" = "move left";
        "${win}+Shift+j" = "move down";
        "${win}+Shift+k" = "move up";
        "${win}+Shift+l" = "move right";
      };
    };
  };
}
