{ config, pkgs, lib, ... }:

let 
in {
  home.packages = with pkgs; [ slack ];
}

