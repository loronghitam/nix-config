{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./config/hypridle.nix
    ./config/hyprlock.nix
    ./config/hyprpaper.nix
    ./config/rofi.nix
    ./config/swaync.nix
    ./config/waybar.nix
    ./config/wlogout.nix
  ];

  home.packages = with pkgs; [
    wl-clipboard
    wl-clip-persist
    pamixer # pulseaudio command line mixer
    brightnessctl
    dunst
    xwaylandvideobridge
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    xwayland.enable = true;
    systemd = {
      enable = true;
      variables = ["--all"];
    };

    plugins = [
      # inputs.hyprland-plugins.packages.${pkgs.system}.hyprbars
    ];

    settings = {
      env = [
        "MOZ_ENABLE_WAYLAND, 1"
      ];

      exec-once = [
        "wl-clip-persist --clipboard both &"
        "wl-paste --watch cliphist store &"
        "waybar"
        "hypridle"
        "hyprpaper"
        "dbus-update-activation-environment --systemd --all"
        "hyprctl setcursor Bibata-Modern-Ice 24 &"
      ];

      windowrulev2 = [
        "opacity 0.0 override,class:^(xwaylandvideobridge)$"
        "noanim,class:^(xwaylandvideobridge)$"
        "noinitialfocus,class:^(xwaylandvideobridge)$"
        "maxsize 1 1,class:^(xwaylandvideobridge)$"
        "noblur,class:^(xwaylandvideobridge)$"
        "nofocus, class:^(xwaylandvideobridge)$"
      ];

      monitor = [
        "eDP-1, 1440x900@60, 0x0, 1"
      ];

      "$mod" = "SUPER";

      bind =
        [
          "$mod, Return, exec, alacritty"
          "$mod, B, exec, librewolf"
          "$mod, Q, killactive"
          "$mod, F, fullscreen, 1"
          "$mod SHIFT, F, fullscreen, 0"
          "$mod, R, exec, rofi -show drun"

          "$mod, j, movefocus, d"
          "$mod, k, movefocus, u"
          "$mod, h, movefocus, l"
          "$mod, l, movefocus, r"

          "$mod SHIFT, h, movewindow, l"
          "$mod SHIFT, l, movewindow, r"
          "$mod SHIFT, k, movewindow, u"
          "$mod SHIFT, j, movewindow, d"
        ]
        ++ (
          builtins.concatLists (builtins.genList (
              i: let
                ws = i + 1;
              in [
                "$mod, code:1${toString i}, workspace, ${toString ws}"
                "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
              ]
            )
            9)
        );

      bindle = [
        # Audio control
        ",XF86AudioRaiseVolume, exec, pamixer -i 5"
        ",XF86AudioLowerVolume, exec, pamixer -d 5"

        # Brightness control
        ",XF86MonBrightnessUp, exec, brightnessctl set 10%-"
        ",XF86MonBrightnessDown, exec, brightnessctl set 10%+"
      ];

      input = {
        touchpad = {
          natural_scroll = "yes";
          disable_while_typing = true;
        };
      };
    };
  };
}
