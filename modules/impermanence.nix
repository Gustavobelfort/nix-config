{ user, ... }:
{
  environment = {
    persistence."/nix/persist" = {
      directories = [
        "/etc/nixos" # bind mounted from /nix/persist/etc/nixos to /etc/nixos
        "/etc/NetworkManager/system-connections"
        "/var/log"
        "/var/lib"
        "/etc/secureboot"
      ];
      files = [
        #"/etc/machine-id"
        "/etc/create_ap.conf"
      ];
      users.${user} = {
        directories = [
          "Downloads"
          "Music"
          "Pictures"
          "Documents"
          "Videos"
          ".cache"
          ".npm-global"
          ".config"
          "Flakes"
          "Projects"
          { directory = ".gnupg"; mode = "0700"; }
          { directory = ".ssh"; mode = "0700"; }
          ".local"
        ];
        files = [
          ".npmrc"
        ];
      };
    };
  };
}
