{
  pkgs,
  lib,
  ...
}: {
  catppuccin = {
    helix.enable = true;
  };
  programs.helix = {
    enable = true;
    settings = {
      theme = lib.mkForce "cattpuccin-transparent";
      editor = {
        lsp = {
          display-inlay-hints = true;
          display-messages = true;
        };

        statusline = {
          left = ["mode" "file-name" "spinner" "read-only-indicator" "file-modification-indicator"];
          right = ["diagnostics" "selections" "register" "file-type" "file-line-ending" "position"];
        };
      };
    };

    languages = {
      language-server = {
        nixd = {
          command = "${pkgs.nixd}/bin/nixd";
          config.nixd = {
            nixpkgs.expr = "import <nixpkgs> { }";
          };
        };
      };
      language = [
        {
          name = "nix";
          auto-format = true;
          formatter.command = "${pkgs.alejandra}/bin/alejandra";
          language-servers = ["nixd"];
        }
        {
          name = "kdl";
          auto-format = true;
          formatter = {
            command = "${pkgs.kdlfmt}/bin/kdlfmt";
            args = ["format" "-"];
          };
        }
        {
          name = "lua";
          auto-format = true;
        }
      ];
    };
    themes = {
      cattpuccin-transparent = {
        "inherits" = "catppuccin-mocha";
        "ui.background" = {};
      };
    };
  };
}
