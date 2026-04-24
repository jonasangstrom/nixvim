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
          homeModule = {
            inherit system;
            module = ./config;
            extraSpecialArgs = {
              inherit inputs;
            };
          };
          workModule = {
            inherit system;
            module = ./config/work.nix;
            extraSpecialArgs = {
              inherit inputs;
            };
          };
          nvimHome = nixvim'.makeNixvimWithModule homeModule;
          nvimWork = nixvim'.makeNixvimWithModule workModule;
          mkPackage =
            nvim: extraPaths:
            pkgs.stdenv.mkDerivation {
              name = "nvim";
              src = null;
              phases = [ "installPhase" ];
              buildInputs = [ pkgs.makeWrapper ];
              installPhase = ''
                mkdir -p $out/bin
                ln -s ${nvim}/bin/nvim $out/bin/nvim
                wrapProgram $out/bin/nvim \
                  --prefix PATH : ${
                    pkgs.lib.makeBinPath (
                      [
                        pkgs.ripgrep
                        pkgs.fd
                        pkgs.sqlite
                      ]
                      ++ extraPaths
                    )
                  }
              '';
            };
        in
        {
          checks = {
            default = nixvimLib.check.mkTestDerivationFromNixvimModule homeModule;
            work = nixvimLib.check.mkTestDerivationFromNixvimModule workModule;
          };

          packages = {
            default = mkPackage nvimHome [ ];
            work = mkPackage nvimWork [
              pkgs.dotnet-sdk_10
              pkgs.omnisharp-roslyn
            ];
          };
        };
    };
}
