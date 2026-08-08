# Neovim Git Integration Configuration
{ ... }:
{
  programs.nixvim.plugins = {
    gitsigns = {
      enable = true;
      settings = {
        current_line_blame = true;
        current_line_blame_opts = {
          delay = 300;
          virt_text = true;
          virt_text_pos = "eol";
        };
        signcolumn = true;
      };
    };
  };
}
