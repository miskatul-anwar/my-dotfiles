# Neovim Navigation & Fuzzy Finder Configuration
{ ... }:
{
  programs.nixvim.plugins = {
    nvim-tree = {
      enable = true;
      settings = {
        view.width = 30;
        filters.dotfiles = false;
        git = {
          enable = true;
          ignore = false;
        };
      };
    };

    telescope = {
      enable = true;
      keymaps = {
        "<leader>ff" = "find_files";
        "<leader>fg" = "live_grep";
        "<leader>fb" = "buffers";
        "<leader>fh" = "help_tags";
        "<leader>gc" = "git_commits";
        "<leader>gs" = "git_status";
      };
    };
  };
}
