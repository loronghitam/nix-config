{lib, ...}: {
  programs.starship = {
    enable = true;
    enableBashIntegration = true;
    enableFishIntegration = true;
    enableTransience = true;
    settings = let
      withStartLineBreak = s: " ${s}";
      withEndLineBreak = s: "${s} ";
      defaultProgramFormat = withEndLineBreak "[$symbol($version)]($style)";
    in {
      add_newline = true;
      command_timeout = 1000;
      battery = {
        full_symbol = "🔋 ";
        charging_symbol = "⚡️ ";
        discharging_symbol = "💀 ";
      };

      bun.format = defaultProgramFormat;
      git_branch.format = withEndLineBreak "[$symbol$branch]($style)";
      git_status.format = withEndLineBreak "([$all_status$ahead_behind]($style))";
      gcloud.format = withEndLineBreak "[$symbol$active]($style)";
      golang.format = defaultProgramFormat;
      nix_shell.symbol = "❄️";
      nix_shell.format = withEndLineBreak "[$symbol$state]($style)";
      nix_shell.impure_msg = "󰊰";
      nix_shell.pure_msg = "󱨧";
      nodejs.format = defaultProgramFormat;
      ocaml.format = withEndLineBreak "[$symbol($version)(\($switch_indicator$switch_name\))]($style)";
      package.format = withEndLineBreak "[$symbol$version]($style)";
      rust.format = defaultProgramFormat;
      zig.format = defaultProgramFormat;
    };
  };
}
