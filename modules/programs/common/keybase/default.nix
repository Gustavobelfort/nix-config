{ config, lib, pkgs, ... }:

{
  home.packages = [
    pkgs.keybase
    pkgs.keybase-gui
  ];
}
