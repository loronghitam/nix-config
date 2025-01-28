{pkgs, ...}: {
  # home.file.".config/hypr/scripts/rofi-wifi.sh" = {
  #   source = ./../hyprland/asset/config/rofi-wifi-menu.sh;
  #   executable = true;
  # };

  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "bottom";
        position = "top";

        modules-left = [
          "sway/workspaces"
        ];

        modules-center = [
          "clock"
        ];

        modules-right = [
          "network"
          "bluetooth"
          "pulseaudio"
          "backlight"
          "cpu"
          "battery"
          "custom/power"
        ];

        "sway/workspaces" = {
          sort-by-number = true;
        };

        "clock" = {
          interval = 60;
          tooltip = false;
          format = "{:%R | %a, %d/%m/%y}";
        };

        "cpu" = {
          interval = 2;
          format = " {}%";
          max-length = 10;
        };

        "pulseaudio" = {
          format = "{icon}";
          format-muted = "󰖁";
          tooltip = true;
          format-alt = "<small>{volume}%</small>";
          on-scroll-up = "pamixer -i 10";
          on-scroll-down = "pamixer -d 10";
          format-icons = {
            default = ["" "" "󰕾"];
          };
          tooltip-format = "Volume {volume}%";
        };

        "backlight" = {
          format = "{icon}";
          tooltip = true;
          format-alt = "<small>{percent}%</small>";
          on-scroll-up = "brightnessctl set 5%+";
          on-scroll-down = "brightnessctl set 5%-";
          format-icons = ["󱩎" "󱩏" "󱩐" "󱩑" "󱩒" "󱩓" "󱩔" "󱩕" "󱩖" "󰛨"];
          tooltip-format = "Brightness {percent}%";
        };

        "network" = {
          interface = "wlan0";
          min-length = 10;
          fixed-width = 10;
          format-wifi = "<small>{bandwidthDownBytes}</small> {icon}";
          format-ethernet = "󰈀";
          format-disconnected = "󰤭";
          tooltip-format = "{essid}";
          interval = 1;
          format-icons = ["󰤯" "󰤟" "󰤢" "󰤥" "󰤨"];
          on-click = "~/.config/hypr/scripts/rofi-wifi.sh";
        };

        "battery" = {
          interval = 5;
          states = {
            "warning" = 30;
            "critical" = 15;
          };
          "format" = "{icon} {capacity}%";
          "format-charging" = "  {capacity}%";
          "format-plugged" = "  {capacity}%";
          "format-alt" = "{icon}  {time}";
          "format-icons" = [" " " " " " " " " "];
        };

        "custom/power" = {
          "format" = " ";
          "on-click" = "wlogout";
        };
      };
    };

    style = ''
      * {
        font-family: "JetBrains Mono Nerd Font";
        font-weight: bold;
        font-size: 13px;
      }
    '';
  };
}
