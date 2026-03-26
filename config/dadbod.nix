{ pkgs, ... }:
{
  plugins = {
    vim-dadbod.enable = true;
    vim-dadbod-completion = {
      enable = true;
      autoLoad = true;
    };

    vim-dadbod-ui.enable = true;
  };
}
