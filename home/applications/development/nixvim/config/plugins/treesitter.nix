{pkgs, ...}: let
  treesitter-blade = pkgs.tree-sitter.buildGrammar {
    language = "blade";
    version = "0.0.0+rev=4ad4d56";
    src = pkgs.fetchFromGitHub {
      owner = "EmranMR";
      repo = "tree-sitter-blade";
      rev = "4ad4d56aca189bf4fa18b8896f9ed4a5e5ddf618";
      hash = "sha256-qRjgWWsFZ9TUVqcGuAFfL/6DW6AqdUuD8tjTkwxpxYM=";
    };
    meta.homepage = "https://github.com/EmranMR/tree-sitter-blade";
  };
in {
  plugins = {
    treesitter = {
      enable = true;
      # folding = true;
      settings = {
        indent.enable = true;
        highlight.enable = true;
      };
      folding = false;
      nixvimInjections = true;
      grammarPackages =
        pkgs.vimPlugins.nvim-treesitter.allGrammars
        ++ [
          treesitter-blade
        ];
    };
  };
  extraConfigLua = ''
    do
             local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
       parser_config.blade = {
         install_info = {
            url = "https://github.com/EmranMR/tree-sitter-blade",
           files = { "src/parser.c" },
           branch = "main",
         },
         filetype = "blade",
       }
    end
  '';
}
