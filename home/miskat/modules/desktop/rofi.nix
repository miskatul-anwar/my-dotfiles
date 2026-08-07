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
        background:     #201A41;
        background-alt: #392684;
        foreground:     #FFFFFF;
        selected:       #F801E8;
        active:         #00CCF5;
        urgent:         #8D0083;
      }

      window {
        transparency:     "real";
        location:         center;
        anchor:           center;
        width:            1000px;
        border-radius:    15px;
        background-color: @background;
      }

      mainbox {
        spacing:          0px;
        background-color: transparent;
        orientation:      vertical;
        children:         [ "inputbar", "listview" ];
      }

      inputbar {
        spacing:          10px;
        padding:          15px;
        border-radius:    10px;
        background-color: @background-alt;
        text-color:       @foreground;
        children:         [ "textbox-prompt-colon", "entry" ];
      }
      textbox-prompt-colon {
        expand:           false;
        str:              "";
        background-color: inherit;
        text-color:       inherit;
      }
      entry {
        background-color: inherit;
        text-color:       inherit;
        cursor:           text;
        placeholder:      "Search";
        placeholder-color: inherit;
      }

      listview {
        columns:          1;
        lines:            8;
        cycle:            true;
        scrollbar:        false;
        spacing:          10px;
        background-color: transparent;
        text-color:       @foreground;
      }

      element {
        spacing:          15px;
        padding:          8px;
        border-radius:    10px;
        background-color: transparent;
        text-color:       @foreground;
        cursor:           pointer;
      }
      element selected.normal {
        background-color: @selected;
        text-color:       @foreground;
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
