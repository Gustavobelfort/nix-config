{ inputs, withSystem, module_args, ... }:
let
  user = "toutaboc";
  domain = "toutaboc.dev";

  sharedModules = [
    (import ../. { inherit user; })
    module_args
    inputs.hyprland.homeManagerModules.default
    inputs.emanote.homeManagerModule
    inputs.nix-index-database.hmModules.nix-index
    inputs.nur.hmModules.nur
  ];

  homeImports = {
    "${user}@elysium" = [ ./elysium ] ++ sharedModules;
  };

  inherit (inputs.home-manager.lib) homeManagerConfiguration;
in
{
  imports = [
    # we need to pass this to NixOS' HM module
    { _module.args = { inherit homeImports user; }; }
  ];

  flake = {
    homeConfigurations = withSystem "x86_64-linux" ({ pkgs, ... }: {
      "${user}@elysium" = homeManagerConfiguration {
        modules = homeImports."${user}@elysium";
        inherit pkgs;
      };
    });
  };
}
