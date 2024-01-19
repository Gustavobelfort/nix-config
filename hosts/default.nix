{ inputs
, sharedModules
, homeImports
, user
, ...
}: {
  flake.nixosConfigurations =
    let
      inherit (inputs.nixpkgs.lib) nixosSystem;
    in
    {
      elysium = nixosSystem {
        specialArgs = { inherit user; };
        modules =
          [
            ./elysium
            ../modules/lanzaboote.nix
            ../modules/impermanence.nix
            ../modules/desktop.nix
            ../modules/fonts.nix
            ../modules/virtualisation
            { home-manager.users.${user}.imports = homeImports."${user}@elysium"; }
          ]
          ++ sharedModules;
      };
      minimal = nixosSystem {
        specialArgs = { inherit user; };
        modules =
          [
            ./minimal
            ../modules/impermanence.nix
            ../modules/systemdboot.nix
            ../modules/impermanence.nix

          ] ++ sharedModules;
      };
    };
}
