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
                "N" = "cmp.mapping.select_next_item()";
                "<C-n>" = "cmp.mapping.select_prev_item()";
            };
        };
    };
}
