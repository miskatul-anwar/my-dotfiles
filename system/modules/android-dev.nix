
{ config, pkgs, lib, ... }:

let
  user = "miskat"; # <-- change this to your actual username
in
{
  ###########################
  # Android Development Setup
  ###########################

  environment.systemPackages = with pkgs; [
    android-studio
    android-tools       # adb, fastboot
    jdk17               # required for Gradle builds
    gradle
  ];

  # Enable adb and allow user to access USB devices
  programs.adb.enable = true;

  users.users.${user}.extraGroups = [
    "adbusers"
    "kvm"
    "libvirtd"
  ];

  # Enable virtualization (for Android Emulator)
  virtualisation.libvirtd.enable = true;

  # Optional: OpenGL / GPU support for emulator performance
  hardware.graphics.enable = true;

  # Optional: better performance with more open files
  security.pam.loginLimits = [
    { domain = "*"; item = "nofile"; type = "soft"; value = "8192"; }
    { domain = "*"; item = "nofile"; type = "hard"; value = "65536"; }
  ];

  # Optional: useful environment variables
  environment.variables = {
    ANDROID_HOME = "$HOME/Android/Sdk";
    ANDROID_SDK_ROOT = "$HOME/Android/Sdk";
    PATH = lib.mkForce "$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools";
  };

  # Optional: Udev rules for Android devices
  services.udev.packages = [ pkgs.android-udev-rules ];

  # Optional: Java setup for consistency
  programs.java = {
    enable = true;
    package = pkgs.jdk17;
  };
}
