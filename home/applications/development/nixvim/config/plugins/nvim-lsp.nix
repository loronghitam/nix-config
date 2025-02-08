{pkgs, ...}: {
  extraPackages = with pkgs; [
    nixd
    alejandra
    phpactor
  ];

  plugins.lsp = {
    enable = true;
    inlayHints = true;
    servers = {
      nixd = {
        enable = true;
        autostart = true;
        settings = {
          nixpkgs.expr = "import <nixpkgs> { }";
          formatting.command = ["alejandra"];
          options = let
            flake = ''(builtins.getFlake "${./../../../../../..}")'';
          in {
            nixos.expr = ''${flake}.nixosConfigurations.nixos.options'';
            home-manager.expr = ''${flake}.home-manager.users.options'';
            nixvim.expr = ''${flake}.packages.x86_64-linux.default.options'';
          };
        };
      };
      html.enable = true;
      htmx.enable = true;
      cssls.enable = true;
      ts_ls.enable = true;
      jsonls.enable = true;
      tailwindcss.enable = true;
    };

    preConfig = ''
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.semanticTokensProvider = nil
    '';
    onAttach = ''
      client.server_capabilities.semanticTokensProvider = nil
    '';
  };

  plugins.lsp-format.enable = true;
}
