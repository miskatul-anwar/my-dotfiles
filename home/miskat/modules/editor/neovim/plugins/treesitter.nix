# Neovim Treesitter Syntax Highlighting Configuration
{ ... }:
{
  programs.nixvim.plugins = {
    treesitter = {
      enable = true;
      settings = {
        highlight.enable = true;
        indent.enable = true;
      };
    };

    rainbow-delimiters.enable = true;
  };
}
