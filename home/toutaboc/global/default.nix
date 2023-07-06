{ inputs, lib, pkgs, config, outputs, ... }:
let
in
{
  imports = [

   ./font.nix
   ./dconf.nix
   ./gtk.nix

  ] ++ (builtins.attrValues outputs.homeManagerModules);


  nix = {
    package = lib.mkDefault pkgs.nix;
    settings = {
      experimental-features = [ "nix-command" "flakes" "repl-flake" ];
      warn-dirty = false;
    };
  };

  nixpkgs = {
    overlays = builtins.attrValues outputs.overlays;
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };
  };


  systemd.user.startServices = "sd-switch";

  programs = {
    home-manager.enable = true;
    git.enable = true;
  };

  home = {
    username = lib.mkDefault "toutaboc";
    homeDirectory = lib.mkDefault "/home/toutaboc";
    sessionPath = [ "$HOME/.local/bin" ];
    stateVersion = lib.mkDefault "23.05";
  };

}
