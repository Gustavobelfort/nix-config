{ system, self, nixpkgs, inputs, user, ... }:

let
  pkgs = import nixpkgs {
    inherit system;
    config.allowUnfree = true; # Allow proprietary software
  };

  lib = nixpkgs.lib;
in
{
  laptop = lib.nixosSystem {
    # Laptop profile
    inherit system;
    specialArgs = { inherit inputs user; };
    modules = [
      ./laptop/wayland #hyprland and sway,go to this dir,choose one
    ] ++ [
      ./system.nix
    ] ++ [
      inputs.impermanence.nixosModules.impermanence
      inputs.nur.nixosModules.nur
      inputs.hyprland.nixosModules.default
      inputs.sops-nix.nixosModules.sops
      inputs.home-manager.nixosModules.home-manager
      {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          extraSpecialArgs = { inherit user; };
          users.${user} = {
            imports = [
              (import ./laptop/wayland/home.nix)
            ] ++ [
              inputs.hyprland.homeManagerModules.default
              inputs.emanote.homeManagerModule
            ];
          };
        };
        nixpkgs = {
          overlays =
            [
              self.overlays.default
              inputs.neovim-nightly-overlay.overlay
              inputs.rust-overlay.overlays.default
              inputs.picom.overlays.default
              inputs.nil.overlays.default
              inputs.joshuto.overlays.default
              inputs.go-musicfox.overlays.default
              inputs.nixd.overlays.default
              (import inputs.emacs-overlay)
            ]
            ++ (import ../overlays);
        };
      }
    ];
  };
}
