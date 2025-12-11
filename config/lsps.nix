{
  plugins = {
    lsp-format = {
      enable = true;
      lspServersToEnable = "all";
    };
    none-ls = {
      enable = true;
      sources.formatting = {
        black.enable = true;
        nixfmt.enable = true;
      };
    };
    lsp = {
      enable = true;
      inlayHints = true;
      keymaps = {
        diagnostic = {
          "<leader>n" = "goto_next";
          "<leader>N" = "goto_prev";
        };
        lspBuf = {
          "gd" = "definition";
          "gD" = "references";
          "rn" = "rename";
          "K" = "hover";
          "gi" = "implementation";
        };
      };
      servers = {
        nixd = {
          enable = true;
          settings = { expr = "import <nixpkgs> {}"; };
        };
        lua_ls.enable = true;
        pyright.enable = true;
        tombi.enable = true;
        yamlls.enable = true;
        dockerls.enable = true;
        roslyn_ls.enable = true;
        rust_analyzer = {
          enable = true;
          installCargo = true;
          installRustc = true;
        };
        ts_ls = {
          enable = true;
          settings = {
            typescript = {
              format = {
                indentSize = 2;
                tabSize = 2;
                convertTabsToSpaces = true;
              };
            };
          };
          settings = {
            javascript = {
              format = {
                indentSize = 2;
                tabSize = 2;
                convertTabsToSpaces = true;
              };
            };
          };
        };
      };
    };
  };
}
