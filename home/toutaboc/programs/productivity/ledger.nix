{ config, pkgs, lib, ... }:

let
in {
  home.packages = with pkgs; [
    ledger-live-desktop
  ];
}

