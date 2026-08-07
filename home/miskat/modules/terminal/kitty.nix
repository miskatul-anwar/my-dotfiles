{ pkgs, ... }:
{
  programs.kitty = {
    enable = true;
    settings = {
      shell = "${pkgs.zsh}/bin/zsh";
      confirm_os_window_close = 0;

      # Font configuration
      font_family      = "JetBrainsMono Nerd Font";
      bold_font        = "auto";
      italic_font      = "auto";
      bold_italic_font = "auto";
      font_size        = "13.0";

      # Window appearance
      window_padding_width = 12;
      background_opacity   = "0.85";
      dynamic_background_opacity = "yes";

      # Color scheme matching Hyprland (#1d192b / #33ccff / #00ff99)
      foreground              = "#c3dde7";
      background              = "#1d192b";
      selection_foreground    = "#1d192b";
      selection_background    = "#33ccff";
      cursor                  = "#33ccff";
      cursor_text_color       = "#1d192b";
      url_color               = "#00ff99";
      active_border_color     = "#33ccff";
      inactive_border_color   = "#465ea7";
      bell_border_color       = "#ff5555";
      wayland_titlebar_color  = "system";

      # Tab bar colors
      active_tab_foreground   = "#1d192b";
      active_tab_background   = "#33ccff";
      inactive_tab_foreground = "#c3dde7";
      inactive_tab_background = "#2b2540";
      tab_bar_background      = "#1d192b";

      # 16 terminal colors
      color0  = "#1d192b";
      color8  = "#465ea7";
      color1  = "#ff5555";
      color9  = "#ff6e6e";
      color2  = "#00ff99";
      color10 = "#50fa7b";
      color3  = "#f1fa8c";
      color11 = "#f1fa8c";
      color4  = "#33ccff";
      color12 = "#6296ca";
      color5  = "#bd93f9";
      color13 = "#d6acff";
      color6  = "#8be9fd";
      color14 = "#a4ffff";
      color7  = "#c3dde7";
      color15 = "#ffffff";
    };
  };
}
