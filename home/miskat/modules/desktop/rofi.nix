{ pkgs, ... }:
{
  programs.rofi = {
    enable   = true;
    package  = pkgs.rofi;  # rofi-wayland merged into rofi
    terminal = "${pkgs.kitty}/bin/kitty";
    theme = builtins.toFile "rofi-theme.rasi" ''
      configuration {
        modi:               "drun,run,filebrowser,window";
        show-icons:         true;
        drun-display-format: "{name}";
        window-format:      "{w} \u00b7 {c} \u00b7 {t}";
      }

      * {
        font:           "JetBrains Mono Nerd Font 10";
        background:     #1e1e2eF2;
        background-alt: #313244;
        foreground:     #cdd6f4;
        selected:       #cba6f7;
        selected-text:  #11111b;
        active:         #89b4fa;
        urgent:         #f38ba8;
        border-color:   #cba6f7;
      }

      window {
        transparency:     "real";
        location:         center;
        anchor:           center;
        width:            750px;
        border:           2px;
        border-color:     @border-color;
        border-radius:    14px;
        background-color: @background;
      }

      mainbox {
        spacing:          10px;
        padding:          15px;
        background-color: transparent;
        orientation:      vertical;
        children:         [ "inputbar", "listview" ];
      }

      inputbar {
        spacing:          10px;
        padding:          12px;
        border-radius:    10px;
        background-color: @background-alt;
        text-color:       @foreground;
        children:         [ "entry" ];
      }
      entry {
        background-color: inherit;
        text-color:       inherit;
        cursor:           text;
        placeholder:      "Search apps & commands...";
        placeholder-color: #889aa1;
      }

      listview {
        columns:          1;
        lines:            7;
        cycle:            true;
        scrollbar:        false;
        spacing:          8px;
        background-color: transparent;
        text-color:       @foreground;
      }

      element {
        spacing:          12px;
        padding:          8px 12px;
        border-radius:    10px;
        background-color: transparent;
        text-color:       @foreground;
        cursor:           pointer;
      }
      element selected.normal {
        background-color: @selected;
        text-color:       @selected-text;
      }
      element-icon {
        background-color: transparent;
        size:             32px;
      }
      element-text {
        background-color: transparent;
        text-color:       inherit;
        vertical-align:   0.5;
      }

      mode-switcher {
        spacing:          20px;
        background-color: transparent;
      }
      button {
        padding:          15px;
        border-radius:    10px;
        background-color: @background-alt;
        cursor:           pointer;
      }
      button selected {
        background-color: @selected;
        text-color:       @foreground;
      }
    '';
  };
}
