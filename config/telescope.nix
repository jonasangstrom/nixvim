{
  plugins.telescope = {
    enable = true;
    keymaps = {
      "<leader>sf" = "find_files";
      "<leader>sg" = "live_grep";
      "<leader>sb" = "buffers";
    };
  };

  extraConfigLua = ''
    local telescope = require("telescope.builtin")
    vim.keymap.set("n", "<leader>sh", function()
    telescope.find_files({
        hidden = true,
        no_ignore = true,
        file_ignore_patterns = { "%.git/" }
    })
    end, { desc = "Find files (including hidden and ignored)" })
  '';
}
