{
  plugins.nvim-tree = {
    enable = true;
    disableNetrw = true;
    view = {
      width = 35;
      relativenumber = true;
    };
    renderer = {
      indentMarkers = {
        enable = true;
      };
    };
  };

  plugins.which-key.settings.spec = [
    {
      __unkeyed-1 = "<leader>ee";
      __unkeyed-2 = "<cmd>NvimTreeToggle<CR>";
      desc = "Toggle file explorer";
    }
    {
      __unkeyed-1 = "<leader>ef";
      __unkeyed-2 = "<cmd>NvimTreeFindFileToggle<CR>";
      desc = "Toggle file explorer on current file";
    }
  ];
}
