{
  opts = {
    shiftwidth = 4;
    tabstop = 4;
    relativenumber = true;
    expandtab = true;
    number = true;
    wrap = false;
    spell = true;
    smartcase = true;
    clipboard = "unnamedplus";
  };
  extraFiles."after/ftplugin/nix.lua".text = ''
    vim.opt_local.expandtab = true
    vim.opt_local.shiftwidth = 2
    vim.opt_local.tabstop = 2
    vim.opt_local.softtabstop = 2

    -- Some Nix plugins force a complex 'indentexpr'. 
    -- If the indentation is still 'jumping' weirdly, uncomment the line below:
    -- vim.opt_local.indentexpr = "" 
  '';
}
