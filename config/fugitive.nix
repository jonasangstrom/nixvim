{
    plugins.fugitive.enable = true;
    keymaps = [
        {
            key =  "<leader>g";
            action = "<cmd>Git<cr>";
            options.silent = true;
        }
    ];
}
