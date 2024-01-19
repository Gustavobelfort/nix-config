{ pkgs, user, config, ... }:
{
  networking = {
    networkmanager.enable = true;
    hosts = {
      "185.199.109.133" = [ "raw.githubusercontent.com" ];
      "185.199.111.133" = [ "raw.githubusercontent.com" ];
      "185.199.110.133" = [ "raw.githubusercontent.com" ];
      "185.199.108.133" = [ "raw.githubusercontent.com" ];
    };
  };

  time.timeZone = "America/Sao_Paulo";

  i18n.defaultLocale = "en_US.UTF-8";

  security.rtkit.enable = true;
  services = {
    openssh = {
      enable = true;
    };
  };

  environment = {
    binsh = "${pkgs.dash}/bin/dash";
    shells = with pkgs; [ fish ];
    systemPackages = with pkgs; [
      gcc
      clang
      zig
      git
      gdb
      gnumake
      glib
      neovim
      wget
      neofetch
      eza
      p7zip
      atool
      unzip
      zip
      rar
      ffmpeg
      xdg-utils
      pciutils
      killall
      socat
      frp
      tailscale
    ];
  };
  services.tailscale.enable = true;
  services.dbus.enable = true;
  services.flatpak.enable = true;

  users.mutableUsers = false;
  users.users.root = {
    initialHashedPassword = "$6$JQ5yd48XKrQWuKXu$5Z/ODgDwiHj5Stj4q9fyFnbAfMyPmqFK4Crsw2mdLZ5q/lAiXma2YjjkE.0oq9vM0ThIK3W9OyORsz1dUaQDK/";
  };
  programs.fish.enable = true;
  users.users.${user} = {
    initialHashedPassword = "$6$JQ5yd48XKrQWuKXu$5Z/ODgDwiHj5Stj4q9fyFnbAfMyPmqFK4Crsw2mdLZ5q/lAiXma2YjjkE.0oq9vM0ThIK3W9OyORsz1dUaQDK/";
    shell = pkgs.fish;
    isNormalUser = true;
    extraGroups = [ "wheel" "video" "audio" ];
  };

  security.polkit.enable = true;
  security.sudo = {
    enable = true;
    extraConfig = ''
      ${user} ALL=(ALL) NOPASSWD:ALL
    '';
  };
  security.doas = {
    enable = true;
    extraConfig = ''
      permit nopass :wheel
    '';
  };

  system.stateVersion = "23.11";
}
