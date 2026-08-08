# Neovim User Interface & Statusline Configuration — Adwaita Pill Aesthetic
{ ... }:
{
  programs.nixvim.plugins = {
    web-devicons.enable = true;

    lualine = {
      enable = true;
      settings = {
        options = {
          theme = "auto";
          globalstatus = true;
          component_separators = { left = ""; right = ""; };
          section_separators = { left = ""; right = ""; };
        };

        sections = {
          lualine_a = [
            {
              __unkeyed-1 = "mode";
              icon = "";
            }
          ];
          lualine_b = [
            {
              __unkeyed-1 = "branch";
              icon = "󰘬";
            }
            {
              __unkeyed-1 = "diff";
              symbols = {
                added = " ";
                modified = "󰏬 ";
                removed = " ";
              };
            }
          ];
          lualine_c = [
            {
              __unkeyed-1 = "diagnostics";
              sources = [ "nvim_diagnostic" ];
              symbols = {
                error = " ";
                warn = " ";
                info = " ";
                hint = "󰌵 ";
              };
            }
            {
              __unkeyed-1 = "filename";
              file_status = true;
              path = 1; # Relative path
            }
          ];
          lualine_x = [
            {
              __unkeyed-1 = "encoding";
            }
            {
              __unkeyed-1 = "fileformat";
              symbols = {
                unix = "";
                dos = "";
                mac = "";
              };
            }
            {
              __unkeyed-1 = "filetype";
              icon_only = false;
            }
          ];
          lualine_y = [
            {
              __unkeyed-1 = "progress";
            }
          ];
          lualine_z = [
            {
              __unkeyed-1 = "location";
              icon = "";
            }
          ];
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
