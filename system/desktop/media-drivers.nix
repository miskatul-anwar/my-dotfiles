# Hardware Video Acceleration (VA-API / VDPAU / Vulkan), GStreamer Codecs & QoL Services
{ pkgs, ... }:
{
  # Hardware Graphics Acceleration (OpenGL / Vulkan / VA-API)
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
      intel-media-driver   # Intel iHD driver for VA-API
      intel-vaapi-driver   # Intel i965 driver
      libva-utils          # vainfo CLI diagnostic tool
      libva-vdpau-driver   # VDPAU driver for VA-API
      libvdpau-va-gl       # VDPAU backend for VA-API
      vulkan-loader        # Vulkan ICD loader
      vulkan-validation-layers
      vulkan-tools         # vulkaninfo CLI diagnostic tool
      clinfo               # OpenCL diagnostic tool
    ];
  };

  # System-wide GStreamer & FFmpeg Codecs (H.264, H.265/HEVC, AV1, VP9, AAC, FLAC)
  environment.systemPackages = with pkgs; [
    ffmpeg-full
    libva
    libva-utils
    vulkan-tools
    clinfo
    gst_all_1.gstreamer
    gst_all_1.gst-plugins-base
    gst_all_1.gst-plugins-good
    gst_all_1.gst-plugins-bad
    gst_all_1.gst-plugins-ugly
    gst_all_1.gst-libav
  ];

  # Quality of Life System Services (Firmware updates, MTP Phone Mounts, Power profiles, Bluetooth)
  services.fwupd.enable = true;                 # Automatic device firmware update service (fwupdmgr)
  services.upower.enable = true;                # Battery status & power management daemon
  services.gvfs.enable = true;                  # Virtual filesystem (Trash, MTP phone mounts, SMB shares)
  services.tumbler.enable = true;               # Image & video thumbnailer service for file managers

  # Bluetooth power management & battery percentage reporting
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings = {
      General = {
        Enable = "Source,Sink,Media,Socket";
        Experimental = true;                    # Enables Bluetooth headset battery reporting
      };
    };
  };
}
