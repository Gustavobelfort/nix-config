{ config, lib, pkgs, ... }:

{
  home.packages = [ pkgs.ledger-live-desktop ];
}
