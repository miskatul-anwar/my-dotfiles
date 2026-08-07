# Declarative Nixvim Module — github:nix-community/nixvim
{ inputs, ... }:
{
  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    nixpkgs.source = inputs.nixpkgs;

    colorschemes.catppuccin = {
      enable = true;
      settings = {
        flavour = "mocha";
        transparent_background = false;
        integrations = {
          cmp = true;
          gitsigns = true;
          nvimtree = true;
          telescope = true;
          treesitter = true;
          which_key = true;
          bufferline = true;
        };
      };
    };

    opts = {
      number = true;
      relativenumber = true;
      shiftwidth = 2;
      tabstop = 2;
      expandtab = true;
      smartindent = true;
      wrap = false;
      ignorecase = true;
      smartcase = true;
      termguicolors = true;
      signcolumn = "yes";
      updatetime = 250;
      timeoutlen = 300;
      clipboard = "unnamedplus";
    };

    globals.mapleader = " ";

    plugins = {
      # UI & Statusline
      lualine = {
        enable = true;
        settings = {
          options = {
            theme = "catppuccin";
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
        };
      };

      web-devicons.enable = true;
      which-key.enable = true;

      # File Explorer & Navigation
      nvim-tree = {
        enable = true;
        settings = {
          view.width = 30;
          filters.dotfiles = false;
        };
      };

      telescope = {
        enable = true;
        keymaps = {
          "<leader>ff" = "find_files";
          "<leader>fg" = "live_grep";
          "<leader>fb" = "buffers";
          "<leader>fh" = "help_tags";
        };
      };

      # Syntax Highlighting
      treesitter = {
        enable = true;
        settings = {
          highlight.enable = true;
          indent.enable = true;
        };
      };

      # LSP (Language Servers)
      lsp = {
        enable = true;
        servers = {
          nixd.enable = true;
          clangd.enable = true;
          pyright.enable = true;
          rust_analyzer = {
            enable = true;
            installCargo = false;
            installRustc = false;
          };
          bashls.enable = true;
        };
      };

      # Auto-Completion Engine
      cmp = {
        enable = true;
        autoEnableSources = true;
        settings = {
          sources = [
            { name = "nvim_lsp"; }
            { name = "luasnip"; }
            { name = "path"; }
            { name = "buffer"; }
          ];
          mapping = {
            "<CR>" = "cmp.mapping.confirm({ select = true })";
            "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
            "<S-Tab>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
          };
        };
      };

      luasnip.enable = true;

      # Git & Editing Helpers
      gitsigns.enable = true;
      comment.enable = true;
      vim-surround.enable = true;
    };

    keymaps = [
      {
        key = "<C-n>";
        action = "<cmd>NvimTreeToggle<CR>";
        mode = "n";
        options = {
          noremap = true;
          silent = true;
          desc = "Toggle NvimTree";
        };
      }
    ];
  };
}
