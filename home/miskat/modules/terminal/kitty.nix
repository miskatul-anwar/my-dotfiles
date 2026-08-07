{ pkgs, ... }:
{
  programs.kitty = {
    enable = true;
    settings = {
      shell = "${pkgs.zsh}/bin/zsh";
      confirm_os_window_close = 0;

      # Font configuration
      font_family      = "CaskaydiaCove Nerd Font Mono";
      bold_font        = "auto";
      italic_font      = "auto";
      bold_italic_font = "auto";
      font_size        = "13.0";

      # Window appearance
      window_padding_width = 12;
      background_opacity   = "0.85";
      dynamic_background_opacity = "yes";

      # Colors (ZaneyOS Catppuccin Mocha)
      foreground              = "#CDD6F4";
      background              = "#1E1E2E";
      selection_foreground    = "#1E1E2E";
      selection_background    = "#F5E0DC";
      cursor                  = "#F5E0DC";
      cursor_text_color       = "#1E1E2E";
      url_color               = "#F5E0DC";
      active_border_color     = "#CBA6F7";
      inactive_border_color   = "#6C7086";
      bell_border_color       = "#F9E2AF";
      wayland_titlebar_color  = "system";
      macos_titlebar_color    = "system";
      active_tab_foreground   = "#11111B";
      active_tab_background   = "#CBA6F7";
      inactive_tab_foreground = "#CDD6F4";
      inactive_tab_background = "#181825";
      tab_bar_background      = "#11111B";

      # 16 terminal colors
      color0  = "#45475a";
      color8  = "#585b70";
      color1  = "#f38ba8";
      color9  = "#f38ba8";
      color2  = "#a6e3a1";
      color10 = "#a6e3a1";
      color3  = "#f9e2af";
      color11 = "#f9e2af";
      color4  = "#89b4fa";
      color12 = "#89b4fa";
      color5  = "#f5c2e7";
      color13 = "#f5c2e7";
      color6  = "#94e2d5";
      color14 = "#94e2d5";
      color7  = "#bac2de";
      color15 = "#a6adc8";
    };
  };
}
