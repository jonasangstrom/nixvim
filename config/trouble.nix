{
  plugins = { trouble = { enable = true; }; };
  keymaps = [{
    key = "<leader>t";
    action = "<cmd>Trouble diagnostics toggle<cr>";
    options.silent = true;
  }];
}
