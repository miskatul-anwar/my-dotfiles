{config, pkgs, ... }:{
  xdg.mime = {
    enable = true;
    defaultApplications = {
      # Default Browser
      "x-scheme-handler/http" = [ "google-chrome.desktop" ];
      "x-scheme-handler/https" = [ "google-chrome.desktop" ];
      "text/html" = [ "google-chrome.desktop" ];
      "application/xhtml+xml" = [ "google-chrome.desktop" ];
      # Terminal
      "x-terminal-emulator" = ["ghostty.desktop"];
    };
  };
}
