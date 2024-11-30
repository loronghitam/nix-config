{pkgs, ...}: {
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
          format-icons = {
            default = ["" "" "󰕾"];
          };
          tooltip-format = "Volume {volume}%";
        };

        "backlight" = {
          format = "{icon}";
          tooltip = true;
          format-alt = "<small>{percent}%</small>";
          format-icons = ["󱩎" "󱩏" "󱩐" "󱩑" "󱩒" "󱩓" "󱩔" "󱩕" "󱩖" "󰛨"];
          tooltip-format = "Brightness {percent}%";
        };

        "network" = {
          interface = "wlan0";
          format-wifi = "<small>{bandwidthDownBytes}</small> {icon}";
          format-ethernet = "󰈀";
          format-disconnected = "󰤭";
          tooltip-format = "{essid}";
          interval = 1;
          format-icons = ["󰤯" "󰤟" "󰤢" "󰤥" "󰤨"];
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
        margin: 5px 5px;
      }

      #workspaces {
        background-color: @surface0;
        margin: 5px;
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
        color: #72D792;
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
        margin: 5px 0;
      }

      #bluetooth {
        color: #E6E7E7;
        background:  #161320;
        opacity: 1;
        margin: 4px 0px 4px 0px;
        padding-left: 4px;
        padding-right: 4px;
      }

      #battery{
        color: #a6d189;
      }

      #clock{
          color: #A1BDCE;
          border-radius: 1rem;
      }

      #pulseaudio{
          color: #6F8FDB;
      }

      #cpu{
          color: #915CAF;
      }

      #network{
        color: #A1BDCE;
      }

      #battery.charging,
      #battery.plugged {
      	color: #E8EDF0;
      }

      #battery.critical:not(.charging) {
          color: red;
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
