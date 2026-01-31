{
  plugins = {
    treesitter = {
      enable = true;
      nixvimInjections = true;
      settings = {
        highlight.enable = true;
        indent.enable = true;
        refactor = {
          enable = true;
          settings = { highlight_definitions.enable = true; };
        };
      };
    };

    hmts.enable = true;
  };
}
