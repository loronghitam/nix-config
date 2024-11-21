{pkgs, ...}: {
  extraPackages = with pkgs; [
    nixd
    alejandra
    phpactor
    intelephense
  ];

  plugins.lsp = {
    enable = true;
    servers = {
      nixd = {
        enable = true;
        autostart = true;
        settings.formatting.command = ["alejandra"];
        extraOptions = {
          nixos = {
            expr = "(builtins.getFlake \"/home/muggle/nix-config\").nixosConfigurations.muggle.options";
          };
          home_manager = {
            expr = "(builtins.getFlake \"/home/muggle/nix-config\").homeConfigurations.muggle.options";
          };
        };
      };
      intelephense = {
        enable = true;
        package = pkgs.intelephense;
      };
      html.enable = true;
      htmx.enable = true;
      cssls.enable = true;
      ts_ls.enable = true;
      # JSON
      jsonls.enable = true;
      # Blade template
      tailwindcss.enable = true;
    };
  };
  plugins.lsp-format.enable = true;
}
