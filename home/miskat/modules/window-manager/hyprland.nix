{ pkgs, ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    extraConfig = ''
      # Main mod key
      $mainMod = SUPER

      # Keybinds
      bind = $mainMod,Return,exec,kitty
      bind = $mainMod,S,exec,grimblast --notify copy screen
      bind = $mainMod,SHIFT,S,exec,grimblast --notify copy area
      bind = $mainMod,A,exec,rofi -show drun
      bind = $mainMod,F,fullscreen,1
      bind = $mainMod,1,workspace,1
      bind = $mainMod,2,workspace,2
      bind = $mainMod,3,workspace,3
      bind = $mainMod,4,workspace,4
      bind = $mainMod,5,workspace,5
      bind = $mainMod,6,workspace,6
      bind = $mainMod,H,exec,rofi -show keys
      bind = $mainMod,L,exec,hyprlock
      bind = $mainMod,SHIFT,F,togglefloating
      bind = $mainMod,SHIFT,J,resizeactive,-20 0
      bind = $mainMod,SHIFT,K,resizeactive,20 0
      bind = $mainMod,SHIFT,L,resizeactive,0 -20
      bind = $mainMod,SHIFT,semicolon,resizeactive,0 20
      bind = $mainMod,C,exec,code
      bind = $mainMod,B,exec,zen exec

      # Basic appearance
      general {
        gaps_in = 8
        border_size = 2
      }
      decoration {
        rounding = 10
      }

      # Monitor config (auto-choose)
      monitor = ,preferred,auto,1

      # Input
      input {
        kb_layout = us
      }
    '';
  };

  programs.kitty.enable = true;
  programs.vscode.enable = true;
  programs.rofi.enable = true;
}