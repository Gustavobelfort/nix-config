{ config, pkgs, user, inputs, lib, ... }:

{
  imports =
    (import ../../../modules/hardware) ++
    (import ../../../modules/virtualisation) ++
    [
      ../hardware-configuration.nix
      ../../../modules/fonts
    ] ++ [
      # ../../../modules/desktop/bspwm
      ../../../modules/desktop/xmonad
    ];

  sops.defaultSopsFile = ../../../secrets/secrets.yaml;
  users.mutableUsers = false;
  users.users.root = {
    initialHashedPassword = "$6$3xpVaWHIbx/hayt7$gDvuGQknCMTb3BO7N3fYDzRN4JTHlQl/UoNna5TIlqWghQsya.nL/ooeDnBkRFY5YUf7dkq/Ioya5Me.0PHWp1";
  };
  programs.fish.enable = true;
  users.users.${user} = {
    initialHashedPassword = "$6$3xpVaWHIbx/hayt7$gDvuGQknCMTb3BO7N3fYDzRN4JTHlQl/UoNna5TIlqWghQsya.nL/ooeDnBkRFY5YUf7dkq/Ioya5Me.0PHWp1";
    shell = pkgs.fish;
    isNormalUser = true;
    extraGroups = [ "wheel" "docker" "libvirtd" "video" "audio" ];
    packages = (with pkgs; [
      tdesktop
      qq
      feishu
      thunderbird
      dbeaver
      aichat
    ]) ++ (with config.nur.repos;[
      # linyinfeng.icalingua-plus-plus
      # linyinfeng.wemeet
    ]);
  };
  boot = {
    supportedFilesystems = [ "ntfs" ];
    kernelPackages = pkgs.linuxPackages_xanmod_latest;
    bootspec.enable = true;
    loader = {
      systemd-boot = {
        enable = lib.mkForce true; #lanzaboote
        consoleMode = "auto";
      };
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot";
      };
      timeout = 3;
    };
    kernelParams = [
      "quiet"
      "splash"
    ];
    consoleLogLevel = 0;
    initrd.verbose = false;
  };

  i18n.inputMethod = {
    enabled = "fcitx5";
    fcitx5.addons = with pkgs; [ fcitx5-rime fcitx5-chinese-addons fcitx5-table-extra ];
  };

  environment = {
    persistence."/nix/persist" = {
      directories = [
        "/etc/nixos" # bind mounted from /nix/persist/etc/nixos to /etc/nixos
        "/etc/NetworkManager/system-connections"
        "/etc/v2raya"
        "/etc/secureboot"
        "/var/log"
        "/var/lib"
      ];
      files = [
        "/etc/machine-id"
      ];
      users.${user} = {
        directories = [
          "Downloads"
          "Music"
          "Pictures"
          "Documents"
          "Videos"
          ".cache"
          "Codelearning"
          ".npm-global"
          ".config"
          ".thunderbird"
          "Flakes"
          "Kvm"
          "Projects"
          ".cabal"
          ".cargo"
          { directory = ".gnupg"; mode = "0700"; }
          { directory = ".ssh"; mode = "0700"; }
          ".local"
          ".mozilla"
          ".emacs.d"
        ];
        files = [
          ".npmrc"
        ];
      };
    };
    systemPackages = with pkgs; [
      libnotify
      xclip
      xorg.xrandr
      cinnamon.nemo
      polkit_gnome
      networkmanagerapplet
      xorg.xev
      alsa-lib
      alsa-utils
      flac
      pulsemixer
      linux-firmware
      sshpass
      pkgs.rust-bin.stable.latest.default
      lxappearance
      imagemagick
      flameshot
    ];
  };

  services.xserver = {
    xkbOptions = "caps:escape";
  };
  console.useXkbConfig = true;

  services.xserver.libinput = {
    enable = true;
    touchpad.naturalScrolling = true;
  };

  services = {
    dbus.packages = [ pkgs.gcr ];
    getty.autologinUser = "${user}";
    gvfs.enable = true;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
    };
  };

  systemd = {
    user.services.polkit-gnome-authentication-agent-1 = {
      description = "polkit-gnome-authentication-agent-1";
      wantedBy = [ "graphical-session.target" ];
      wants = [ "graphical-session.target" ];
      after = [ "graphical-session.target" ];
      serviceConfig = {
        Type = "simple";
        ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
        Restart = "on-failure";
        RestartSec = 1;
        TimeoutStopSec = 10;
      };
    };
  };
  security.polkit.enable = true;
  security.sudo = {
    enable = false;
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

}
