{ ... }:
{
  plugins.lualine.enable = true;
  plugins.web-devicons.enable = true;
  plugins.which-key.enable = true;
  plugins.gitsigns.enable = true;
  imports = [
    ./lsps.nix
    ./telescope.nix
    ./undotree.nix
    ./oil.nix
    ./fugitive.nix
    ./treesitter.nix
    ./cmp.nix
    ./luasnip.nix
    ./trouble.nix
    ./dap.nix
  ];
}
