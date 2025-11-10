{
    plugins.cmp = {
        enable = true;
        settings = {
            sources = [
                { name = "nvim_lsp";}
                { name = "buffer";}
                { name = "path";}
                { name = "luasnip";}
            ];
            mapping = {
                "<C-n>" = "cmp.mapping.select_next_item()";
                "<C-j>" = "cmp.mapping.select_prev_item()";
                "<CR>" = "cmp.mapping.confirm({ select = true })";
            };
        };
    };
}
