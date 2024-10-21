{pkgs, ...}: {
  programs.helix = {
    enable = true;
    languages.language = [
      {
        name = "nix";
        auto-format = true;
        # completion = true;
        # auto-completion = true;
        formatter.command = "${pkgs.alejandra}/bin/alejandra";
        language-servers = ["nil"];
      }
    ];
  };
}
