{pkgs, ...}: {
  extraPlugins = with pkgs.vimPlugins; [
    gruvbox
  ];
  plugins.lualine = {
    enable = true;
    settings = {
      options = {
        theme = "gruvbox";
      };
    };
  };
}
