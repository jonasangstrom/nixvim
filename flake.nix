{
  description = "A nixvim configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nixvim.url = "github:nix-community/nixvim";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs =
    { nixvim, flake-parts, ... }@inputs:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];

      perSystem =
        { system, pkgs, ... }:
        let
          nixvimLib = nixvim.lib.${system};
          nixvim' = nixvim.legacyPackages.${system};
          nixvimModule = {
            inherit system; # or alternatively, set `pkgs`
            module = import ./config { inherit pkgs; }; # import the module directly
            # You can use `extraSpecialArgs` to pass additional arguments to your module files
            extraSpecialArgs = {
              # inherit (inputs) foo;
            };
          };
          nvim = nixvim'.makeNixvimWithModule nixvimModule;
        in
        {
          checks = {
            # Run `nix flake check .` to verify that your config is not broken
            default = nixvimLib.check.mkTestDerivationFromNixvimModule nixvimModule;
          };

          packages = {
            # Lets you run `nix run .` to start nixvim
			default = pkgs.symlinkJoin {
    name = "nvim";
    paths = [
      nvim
      pkgs.ripgrep
	  pkgs.dotnet-sdk
	  pkgs.omnisharp-roslyn
      pkgs.dotnet-sdk_9
	  pkgs.fd
	  pkgs.libunwind
    ];
    buildInputs = [ pkgs.makeWrapper ];
    postBuild = ''
      wrapProgram $out/bin/nvim \
        --prefix PATH : ${pkgs.lib.makeBinPath [ pkgs.ripgrep ]} \
        --prefix PATH : ${pkgs.lib.makeBinPath [ pkgs.fd ]} \
        --prefix PATH : ${pkgs.lib.makeBinPath [ pkgs.dotnet-sdk_9 ]} \
        --prefix PATH : ${pkgs.lib.makeBinPath [ pkgs.omnisharp-roslyn ]} 
    '';
  };
          };
        };
    };
}
