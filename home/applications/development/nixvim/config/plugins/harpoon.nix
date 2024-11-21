{
  plugins.harpoon = {
    enable = true;
    keymapsSilent = true;

    keymaps = {
      addFile = "<leader>a";
      toggleQuickMenu = "<C-e>";
      navFile = {
        "1" = "<C-j>";
        "2" = "<C-k>";
        "3" = "<C-l>";
        "4" = "<C-m>";
      };
    };
  };

  # plugins.which-key.settings.spec = [
  #   {
  #     __unkeyed-1 = "<leader>a";
  #     __unkeyed-2 = "<cmd>Harpoon";
  #     desc = "Harpoon add file";
  #   }
  #   {
  #     __unkeyed-1 = "<C-e>";
  #     __unkeyed-2 = "<cmd>Harpoon";
  #     desc = "Harpoon Toggle UI";
  #   }
  # ];
}
