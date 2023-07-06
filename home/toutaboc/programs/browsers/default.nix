
{ pkgs, lib, outputs, ... }:
{
  imports = [
    ./firefox.nix
    ./chromium.nix
  ];
}
