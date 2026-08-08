# Neovim User Interface & Statusline Configuration
{ ... }:
{
  programs.nixvim.plugins = {
    web-devicons.enable = true;

    lualine = {
      enable = true;
      settings = {
        options = {
          theme = "auto";
          component_separators = { left = "│"; right = "│"; };
          section_separators = { left = "󰅂"; right = "󰅁"; };
        };
      };
    };

    bufferline = {
      enable = true;
      settings.options = {
        diagnostics = "nvim_lsp";
        separator_style = "slant";
        always_show_bufferline = true;
      };
    };

    which-key = {
      enable = true;
      settings = {
        spec = [
          { __unkeyed = "<leader>f"; group = "Find/Telescope"; }
          { __unkeyed = "<leader>b"; group = "Buffer"; }
          { __unkeyed = "<leader>c"; group = "Code/LSP"; }
          { __unkeyed = "<leader>g"; group = "Git"; }
        ];
      };
    };

    dressing.enable = true;

    alpha = {
      enable = true;
      theme = "dashboard";
    };
  };
}
