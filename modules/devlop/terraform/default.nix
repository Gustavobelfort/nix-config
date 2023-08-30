{ config, lib, pkgs, ... }:

{
  home.packages = [
    pkgs.terraform
    pkgs.terraform-ls
    pkgs.tflint
  ];
}
