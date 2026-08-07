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

      # Color scheme matching Hyprland (Golden Accent Palette: #1a1a24 / #f3be53 / #ffd700)
      foreground              = "#e6e6ee";
      background              = "#1a1a24";
      selection_foreground    = "#1a1a24";
      selection_background    = "#f3be53";
      cursor                  = "#f3be53";
      cursor_text_color       = "#1a1a24";
      url_color               = "#ffd700";
      active_border_color     = "#f3be53";
      inactive_border_color   = "#3a3a4a";
      bell_border_color       = "#ff5555";
      wayland_titlebar_color  = "system";

      # Tab bar colors
      active_tab_foreground   = "#1a1a24";
      active_tab_background   = "#f3be53";
      inactive_tab_foreground = "#e6e6ee";
      inactive_tab_background = "#2a2a3b";
      tab_bar_background      = "#1a1a24";

      # 16 terminal colors
      color0  = "#1a1a24";
      color8  = "#5c5c70";
      color1  = "#ff5555";
      color9  = "#ff6e6e";
      color2  = "#e5c07b";
      color10 = "#f7c04a";
      color3  = "#f3be53";
      color11 = "#ffd700";
      color4  = "#e6c368";
      color12 = "#f3be53";
      color5  = "#bd93f9";
      color13 = "#d6acff";
      color6  = "#f7c04a";
      color14 = "#ffe082";
      color7  = "#e6e6ee";
      color15 = "#ffffff";
    };
  };
}
