{ config, pkgs, ... }:
let
in
{
  imports = [ ./hardware-configuration.nix ];

  networking.hostName = "elysium";

  boot = {
    kernelPackages = pkgs.linuxPackages_xanmod_latest;
    kernelParams = [
      "quiet"
      "splash"
      "nvidia_drm.modeset=1"
    ];
  };

  services = {
    tlp.enable = true;
    auto-cpufreq.enable = true;
    xserver.videoDrivers = [ "nvidia" "amdgpu" ];
  };
  hardware = {
    nvidia = {
      nvidiaSettings = true;
      open = false;
      modesetting.enable = true;
      powerManagement.finegrained = true;
      powerManagement.enable = true;
      prime = {
        offload.enable = true;
        offload.enableOffloadCmd = true;
        amdgpuBusId = "PCI:08:00:0";
        nvidiaBusId = "PCI:01:00:0";
      };
      package = config.boot.kernelPackages.nvidiaPackages.stable;
    };
    opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
      extraPackages = with pkgs; [
        nvidia-vaapi-driver
        vaapiVdpau
        libvdpau-va-gl
      ];
    };
    pulseaudio.support32Bit = true;
  };
  environment = {
    systemPackages = with pkgs; [
      libva
      libva-utils
      glxinfo
    ];
  };

  environment.variables = {
    __NV_PRIME_RENDER_OFFLOAD = "1";
    __NV_PRIME_RENDER_OFFLOAD_PROVIDER = "NVIDIA-G0";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    __VK_LAYER_NV_optimus = "NVIDIA_only";
    LIBVA_DRIVER_NAME = "nvidia";
    # WLR_RENDERER = "vulkan";
    GBM_BACKEND = "nvidia-drm";
    WLR_DRM_DEVICES = "/dev/dri/card0:/dev/dri/card1";
    WLR_NO_HARDWARE_CURSORS = "1";
    WLR_RENDERER_ALLOW_SOFTWARE = "1";
  };
}
