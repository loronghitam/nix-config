{
  plugins.lspkind = {
    enable = true;
    symbolMap = {
      # Codeium = "󰘦 ";
      #   Copilot = " ";
      #   Suggestion = " ";
      #   TabNine = "󰏚 ";
      #   Supermaven = "";
      #   Error = "";
      #   Hint = "";
      #   Info = "";
      #   Warn = "";
      DiagnosticSignError = "";
      DiagnosticSignHint = "";
      DiagnosticSignInfo = "";
      DiagnosticSignWarn = "";
    };
    cmp.enable = true;
    cmp.maxWidth = 24;
  };

  plugins = {
    friendly-snippets.enable = true;
    luasnip.enable = true;
    cmp = {
      enable = true;
      autoEnableSources = true;
      settings = {
        sources = [
          {name = "nvim_lsp";}
          {name = "buffer";}
          {name = "path";}
          {name = "cmdline";}
          {name = "luasnip";}
        ];

        completion = {
          completeopt = "menu,menuone,preview,noselect";
        };

        snippet = {expand = "luasnip";};
        formatting = {fields = ["kind" "abbr" "menu"];};
        window = {
          completion = {border = "solid";};
          documentation = {border = "solid";};
        };

        mapping = {
          "<C-k>" = "cmp.mapping.select_prev_item()";
          "<C-j>" = "cmp.mapping.select_next_item()";
          "<C-b>" = "cmp.mapping.scroll_docs(-4)";
          "<C-f>" = "cmp.mapping.scroll_docs(4)";
          "<C-Space>" = "cmp.mapping.complete()";
          "<C-Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
          "<C-e>" = "cmp.mapping.abort()";
          "<CR>" = "cmp.mapping.confirm({ select = false })";
        };
      };
    };
    cmp-nvim-lsp = {enable = true;}; # lsp
    cmp-buffer = {enable = true;};
    cmp-path = {enable = true;}; # file system paths
    cmp_luasnip = {enable = true;}; # snippets
    # cmp-cmdline = {enable = false;}; # autocomplete for cmdline
  };
}
