{ ... }:
{
  home.file.".config/fastfetch/nixos.png".source = ../../assets/nixos.png;

  home.file.".config/fastfetch/config.jsonc".text = ''
    {
      "$schema": "https://github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json",
      "logo": {
        "source": "~/.config/fastfetch/nixos.png",
        "type": "auto",
        "width": 30,
        "height": 15,
        "padding": {
          "top": 1,
          "left": 2,
          "right": 4
        }
      },
      "display": {
        "separator": "  󰅂  ",
        "color": {
          "keys": "magenta",
          "title": "cyan"
        }
      },
      "modules": [
        {
          "type": "custom",
          "format": "╭─────────────────── 󰋜 System Info ───────────────────╮"
        },
        {
          "type": "title",
          "color": {
            "user": "magenta",
            "at": "white",
            "host": "cyan"
          }
        },
        {
          "type": "os",
          "key": " 󰣇 OS",
          "keyColor": "blue"
        },
        {
          "type": "host",
          "key": " 󰌢 Device",
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
          "type": "wm",
          "key": " 󰍹 WM",
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
          "format": "╰─────────────────────────────────────────────────────╯"
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
