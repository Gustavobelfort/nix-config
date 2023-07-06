{ outputs, lib, ... }:
let
  hostnames = builtins.attrNames outputs.nixosConfigurations;
in
{
  programs.ssh = {
    enable = true;

    matchBlocks = {
      "*" = {
        extraOptions = {
           IdentityAgent = "~/.1password/agent.sock";
        };
      };
      net = {
        host = builtins.concatStringsSep " " hostnames;
        forwardAgent = true;
        remoteForwards = [{
          bind.address = ''/%d/.gnupg-sockets/S.gpg-agent'';
          host.address = ''/%d/.gnupg-sockets/S.gpg-agent.extra'';
        }];
      };
    };
  };
}
