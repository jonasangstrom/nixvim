{ pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;

  imports = [
    ./options.nix
    ./plugins.nix
  ];

  extraPackages = [
    pkgs.ripgrep
    pkgs.fd
    pkgs.sqlite
  ];
}
