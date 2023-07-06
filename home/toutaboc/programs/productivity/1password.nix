{ config, pkgs, lib, ... }:

let 
in {
  home.packages = with pkgs; [ 
    _1password
    _1password-gui
  ];
}

