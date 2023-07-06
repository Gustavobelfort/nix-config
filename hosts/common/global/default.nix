# This file (and the global directory) holds config that i use on all hosts
{ inputs, outputs, ... }: {
  imports = [
    inputs.home-manager.nixosModules.home-manager
    # ./acme.nix
    # ./auto-upgrade.nix
    ./fish.nix
    # ./locale.nix
    ./nix.nix
    ./ledger.nix
    # ./openssh.nix
    # ./optin-persistence.nix
    # ./podman.nix
    # ./sops.nix
    # ./ssh-serve-store.nix
    # ./steam-hardware.nix
    # ./systemd-initrd.nix
    ./tailscale.nix
  ] ++ (builtins.attrValues outputs.nixosModules);

  home-manager.extraSpecialArgs = { inherit inputs outputs; };



  environment.enableAllTerminfo = true;

  hardware.enableRedistributableFirmware = true;
  networking.domain = "belfort.dev";

  # Increase open file limit for sudoers
  security.pam.loginLimits = [
    {
      domain = "@wheel";
      item = "nofile";
      type = "soft";
      value = "524288";
    }
    {
      domain = "@wheel";
      item = "nofile";
      type = "hard";
      value = "1048576";
    }
  ];
}
