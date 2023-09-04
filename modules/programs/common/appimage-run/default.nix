{ config, lib, pkgs, ... }:

{
  home.packages = [ pkgs.appimage-run.override { extraPkgs = p: [ p.gnome3.libsecret ]; } ];
}
