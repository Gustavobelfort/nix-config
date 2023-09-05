args@{ config, pkgs, ... }:

{
  home.packages = [ pkgs.anytype ];
}
