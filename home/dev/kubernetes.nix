{ config, lib, pkgs, ... }:

{
  home.packages = [
    pkgs.kubernetes
    pkgs.k9s
    pkgs.kubernetes-helm
    pkgs.operator-sdk
    pkgs.minikube
  ];
}
