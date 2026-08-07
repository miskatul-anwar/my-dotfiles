# Fastfetch — Sleek & Modern Fastfetch Configuration
{ ... }:
{
  home.file.".config/fastfetch/config.jsonc".text = ''
    {
      "$schema": "https://github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json",
      "logo": {
        "type": "small",
        "padding": {
          "top": 1,
          "left": 2,
          "right": 3
        }
      },
      "display": {
        "separator": " 󰁔  ",
        "color": {
          "keys": "magenta",
          "title": "cyan"
        }
      },
      "modules": [
        {
          "type": "title",
          "color": {
            "user": "magenta",
            "at": "white",
            "host": "cyan"
          }
        },
        {
          "type": "custom",
          "format": "╭──────────────────────────────────────────────╮"
        },
        {
          "type": "os",
          "key": " 󰣇 OS",
          "keyColor": "blue"
        },
        {
          "type": "host",
          "key": " 󰌢 Host",
          "keyColor": "blue"
        },
        {
          "type": "kernel",
          "key": " 󰌽 Kernel",
          "keyColor": "blue"
        },
        {
          "type": "uptime",
          "key": " 󰅐 Uptime",
          "keyColor": "blue"
        },
        {
          "type": "packages",
          "key": " 󰏖 Packages",
          "keyColor": "blue"
        },
        {
          "type": "shell",
          "key": " 󰞷 Shell",
          "keyColor": "cyan"
        },
        {
          "type": "wm",
          "key": " 󰍹 WM",
          "keyColor": "cyan"
        },
        {
          "type": "terminal",
          "key": " 󰞍 Terminal",
          "keyColor": "cyan"
        },
        {
          "type": "cpu",
          "key": "  CPU",
          "keyColor": "magenta"
        },
        {
          "type": "gpu",
          "key": " 󰢮 GPU",
          "keyColor": "magenta"
        },
        {
          "type": "memory",
          "key": "  Memory",
          "keyColor": "magenta"
        },
        {
          "type": "custom",
          "format": "╰──────────────────────────────────────────────╯"
        },
        "break",
        {
          "type": "colors",
          "symbol": "circle"
        }
      ]
    }
  '';
}
