{ lib, pkgs, config, ... }:
with lib;
let
  cfg = config.drivers.nvidia-prime;
in
{
  options.drivers.nvidia-prime = {
    enable = mkEnableOption "Enable Nvidia Prime Hybrid GPU Offload";
    intelBusID = mkOption {
      type = types.str;
      default = "PCI:0:2:0"; # Intel iGPU bus
    };
    nvidiaBusID = mkOption {
      type = types.str;
      default = "PCI:1:0:0"; # GTX 1050 Ti bus
    };
  };

  config = mkIf cfg.enable {
    hardware.nvidia = {
      prime = {
        offload = {
          enable = true;
          enableOffloadCmd = false; # simpler for older GPU
        };
        # Make sure to use the correct Bus ID values for your system
        intelBusId = cfg.intelBusID;
        nvidiaBusId = cfg.nvidiaBusID;
      };
    };

    # Optional: enable X11 driver if not already
    services.xserver.videoDrivers = [ "intel" "nvidia" ];
  };
}

