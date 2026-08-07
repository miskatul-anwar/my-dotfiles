# PipeWire Audio Infrastructure & High-Fidelity Bluetooth Codecs
{ pkgs, ... }:
{
  # Disable legacy PulseAudio service
  services.pulseaudio.enable = false;

  # Realtime Kit priority scheduling for zero-latency audio processing
  security.rtkit.enable = true;

  # PipeWire core audio server + WirePlumber session manager
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
    wireplumber.enable = true;

    # High-quality Bluetooth audio codec support
    extraConfig.pipewire = {
      "10-clock-rate" = {
        "context.properties" = {
          "default.clock.rate" = 48000;
          "default.clock.allowed-rates" = [ 44100 48000 88200 96000 192000 ];
        };
      };
    };
  };

  # Audio management & DSP tools
  environment.systemPackages = with pkgs; [
    pavucontrol      # GTK volume mixer & stream router
    easyeffects      # PipeWire equalizer, noise suppression, and DSP effects
    helvum          # Graphical PipeWire patchbay
    alsa-utils       # alsamixer, amixer command line tools
    pulsemixer       # CLI PulseAudio/PipeWire volume mixer
    playerctl        # MPRIS media player controller
    pamixer          # CLI volume controls for waybar/hyprland
  ];
}
