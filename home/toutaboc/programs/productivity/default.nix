
{ pkgs, lib, outputs, ... }:
{
  imports = [
    ./1password.nix
    ./keybase.nix
    ./kitty.nix
    ./ledger.nix
  ];
}
