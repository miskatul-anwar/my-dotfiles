# Android development — disabled by default, uncomment in system/profiles/common.nix to enable
{ pkgs, ... }:
{
  nixpkgs.config.android_sdk.accept_license = true;

  environment.systemPackages = with pkgs; [
    android-studio-full
    android-tools
    javaPackages.compiler.openjdk17
  ];
}
