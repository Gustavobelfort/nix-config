{ config, pkgs, lib, ... }:

let
in {
  home.packages = with pkgs; [
    k9s
    kubectl
  ];
}

