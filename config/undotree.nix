{
  plugins.undotree.enable = true;
  keymaps = [{
    mode = "n";
    key = "<leader>u";
    action = "<cmd>UndotreeToggle<CR>";
    options = {
      silent = true;
      desc = "Toggle Undotree";
    };
  }];
}
