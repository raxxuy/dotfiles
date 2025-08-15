{
  programs.nixvim.keymaps = [
    {
      mode = "n";
      key = "<leader>e";
      action = "<cmd>Neotree toggle<CR>";

      options = {
        noremap = true;
        silent = true;
      };
    }
  ];
}
