{pkgs, ...}: {
  extraPlugins = with pkgs.vimPlugins; [
    tokyonight-nvim
  ];
  plugins.lualine = {
    enable = true;
    settings = {
      options = {
        theme = "tokyonight-night";
      };
    };
  };
}
