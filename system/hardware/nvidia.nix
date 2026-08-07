{ inputs, config, pkgs, ... }:
let
  lib = inputs.nixpkgs.lib;
in
{
  # Load nvidia driver for Xorg and Wayland
  services.xserver.videoDrivers = [ "nvidia" ];

  # Enable GPU access from containers (Docker, Podman)
  hardware.nvidia-container-toolkit.enable = true;

  # Ensure NVIDIA kernel modules are loaded before the CDI spec generator runs.
  # Required in PRIME offload mode where the driver is not auto-loaded at boot.
  systemd.services.nvidia-container-toolkit-cdi-generator = {
    serviceConfig = {
      ExecStartPre = [
        "-${pkgs.kmod}/bin/modprobe nvidia"
        "-${pkgs.kmod}/bin/modprobe nvidia_uvm"
      ];
    };
  };

  hardware.nvidia = {
    modesetting.enable = true;

    # Save full VRAM to /tmp on suspend (prevents graphical corruption on resume)
    powerManagement.enable = true;

    # Fine-grained power management — turns GPU off when idle
    # Works on Turing and newer; GTX 1050 Ti (Pascal) supports it via legacy driver
    powerManagement.finegrained = true;

    # Use proprietary closed-source driver (open = false)
    open = false;

    nvidiaSettings = true;

    # GTX 1050 Ti (Pascal) — production (595.xx+) dropped Pascal support
    package = config.boot.kernelPackages.nvidiaPackages.legacy_580;

    prime = {
      offload = {
        enable = true;
        enableOffloadCmd = true;
      };
      nvidiaBusId = "PCI:1:0:0";
      intelBusId  = "PCI:0:2:0";
    };
  };

  # Specialisation: boot into full NVIDIA sync mode for max GPU performance
  specialisation = {
    nvidia-sync.configuration = {
      system.nixos.tags = [ "nvidia-sync" ];
      hardware.nvidia = {
        powerManagement.finegrained   = lib.mkForce false;
        prime.offload.enable          = lib.mkForce false;
        prime.offload.enableOffloadCmd = lib.mkForce false;
        prime.sync.enable             = lib.mkForce true;
      };
    };
  };
}
