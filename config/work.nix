{ pkgs, inputs, ... }:
{
  imports = [
    ./default.nix
    ./csharp.nix
  ];

  extraPackages = [
    pkgs.dotnet-sdk_10
  ];
}
