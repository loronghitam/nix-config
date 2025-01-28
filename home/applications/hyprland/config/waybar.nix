{pkgs, ...}: {
  home.file.".config/hypr/scripts/rofi-wifi.sh" = {
    source = ./../asset/config/rofi-wifi-menu.sh;
    executable = true;
  };
  programs.waybar = {
    enable = true;
    catppuccin.enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        mod = "dock";

        modules-left = [
          "hyprland/workspaces"
        ];

        modules-center = [
          "clock"
        ];

        modules-right = [
          "cpu"
          "pulseaudio"
          "backlight"
          "network"
          "battery"
          "custom/power"
        ];

        "hyprland/workspaces" = {
          "format" = "{icon}";
          "format-icons" = {
            "1" = "";
            "2" = "";
            "3" = "";
            "4" = "";
            "5" = "";
            "active" = "";
            "default" = "";
          };
          "persistent-workspaces" = {
            "*" = 5;
          };
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

      #waybar {
        background: transparent;
        color: @text;
      }

      #workspaces {
        background-color: @surface0;
        margin: 5px 5px;
        border-radius: 1rem;
        padding-left: 4px;
        padding-right: 10px;
      }

      #workspaces button {
        color: @lavender;
        box-shadow: none;
      	text-shadow: none;
        border-radius: 1rem;
        padding-left: 4px;
        padding-right: 5px;
      }

      #workspaces button.active {
        color: @sky;
      }

      #workspaces button:hover {
        background: none;
        border: none;
        color: @sapphire;
        box-shadow: none; /* Remove predefined box-shadow */
        text-shadow: none; /* Remove predefined text-shadow */
        background: none; /* Remove predefined background color (white) */
        transition: none; /* Disable predefined animations */
      }


      #battery,
      #cpu,
      #pulseaudio,
      #backlight,
      #network,
      #clock,
      #custom-power {
        background-color: @surface0;
        padding: 0.5rem 1rem;
        margin: 5px 0px;
      }

      #backlight {
        color: @yellow;
      }

      #bluetooth {
        color: @blue;
      }

      #battery{
        color: @green;
      }

      #clock{
          color: @blue;
          border-radius: 1rem;
          margin: 5px 5px;
      }

      #pulseaudio{
          color: @maroon;
      }

      #cpu{
          color: #915CAF;
      }

      #network{
        color: #A1BDCE;
      }

      #battery.charging,
      #battery.plugged {
      	color: @green;
      }

      #battery.critical:not(.charging) {
          color: @red;
      }

      #cpu {
        border-radius: 1rem 0 0 1rem;
      }

      #custom-power {
        border-radius: 0 1rem 1rem 0;
      }
    '';
  };
}
