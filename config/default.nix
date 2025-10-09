{ pkgs }:
{
    # Import all your configuration modules here
    globals = {
	mapleader = " ";
	maplocalleader =  " ";
    };
    colorschemes.catppuccin.enable = true;
    imports = [
	./options.nix
	(import ./lsps.nix {inherit pkgs;})
	./plugins.nix
    ];
}
