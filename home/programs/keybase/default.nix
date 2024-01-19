{ pkgs, ... }:
{
  home = {
    packages = with pkgs; [
      keybase
      keybase-gui
    ];
  };

  services.keybase.enable = true;

  services.kbfs = {
    enable = true;
    mountPoint = "%t/kbfs";
    extraFlags = [ "-label %u" ];
  };

  systemd.user.services = {
    keybase.serviceConfig.Slice = "keybase.slice";

    kbfs = {
      environment = { KEYBASE_RUN_MODE = "prod"; };
      serviceConfig.Slice = "keybase.slice";
    };

    keybase-gui = {
      serviceConfig = {
        ExecStart  = "${pkgs.keybase-gui}/share/keybase/Keybase";
        PrivateTmp = true;
        Slice      = "keybase.slice";
      };
    };
  };


}
