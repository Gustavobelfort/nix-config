{ config, pkgs, lib, ... }:

let 
in {
  home.packages = with pkgs; [ 
    keybase
    keybase-gui
  ];
}

