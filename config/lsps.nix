{ pkgs }:
{
    plugins = {
		lsp-format = {
			enable = true;
			lspServersToEnable = "all";
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
					settings = {
					expr = "import <nixpkgs> {}";
					};
				};
				lua_ls.enable = true;
				pyright.enable = true;
				dockerls.enable = true;
                roslyn_ls.enable = true;
                #omnisharp = {
                #	enable = true;
				#   package = pkgs.omnisharp-roslyn;
                #};
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
