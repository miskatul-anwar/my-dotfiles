# Neovim Utility & Editing Helper Plugins Configuration
{ ... }:
{
  programs.nixvim.plugins = {
    comment.enable = true;
    nvim-autopairs.enable = true;
    vim-surround.enable = true;

    indent-blankline = {
      enable = true;
      settings = {
        indent.char = "│";
        scope.enabled = true;
      };
    };

    todo-comments.enable = true;

    toggleterm = {
      enable = true;
      settings = {
        open_mapping = "[[<c-t>]]";
        direction = "float";
        float_opts = {
          border = "curved";
        };
      };
    };
  };
}
