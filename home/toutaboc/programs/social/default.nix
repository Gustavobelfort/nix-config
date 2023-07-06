
{ pkgs, lib, outputs, ... }:
{
  imports = [
    ./discord.nix
    ./slack.nix
    ./spotify.nix
  ];

  home.packages = with pkgs; [
  ];
}
