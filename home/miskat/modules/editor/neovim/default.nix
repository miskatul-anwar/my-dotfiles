# Neovim / Nixvim IDE module — Catppuccin Mocha, LSP, Telescope, Treesitter & Completion
{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    withRuby = false;
    withPython3 = true;

    plugins = with pkgs.vimPlugins; [
      # Theme & UI
      catppuccin-nvim
      lualine-nvim
      bufferline-nvim
      nvim-web-devicons
      which-key-nvim
      indent-blankline-nvim

      # Navigation & File Explorer
      nvim-tree-lua
      telescope-nvim
      plenary-nvim

      # Syntax & Parsing
      nvim-treesitter.withAllGrammars

      # LSP & Completion
      nvim-lspconfig
      nvim-cmp
      cmp-nvim-lsp
      cmp-buffer
      cmp-path
      luasnip
      cmp_luasnip

      # Git Integration
      gitsigns-nvim

      # Editing Utilities
      vim-surround
      comment-nvim
    ];

    initLua = ''
      -- ── General Options ──────────────────────────────────────────────
      vim.g.mapleader = " "
      vim.g.maplocalleader = " "

      local opt = vim.opt
      opt.number = true
      opt.relativenumber = true
      opt.tabstop = 2
      opt.shiftwidth = 2
      opt.expandtab = true
      opt.smartindent = true
      opt.wrap = false
      opt.ignorecase = true
      opt.smartcase = true
      opt.termguicolors = true
      opt.signcolumn = "yes"
      opt.updatetime = 250
      opt.timeoutlen = 300
      opt.clipboard = "unnamedplus"

      -- ── Catppuccin Theme ─────────────────────────────────────────────
      require("catppuccin").setup({
        flavour = "mocha",
        transparent_background = true,
        integrations = {
          cmp = true,
          gitsigns = true,
          nvimtree = true,
          telescope = true,
          treesitter = true,
          which_key = true,
          bufferline = true,
        }
      })
      vim.cmd.colorscheme("catppuccin-mocha")

      -- ── Lualine Statusline ───────────────────────────────────────────
      require("lualine").setup({
        options = {
          theme = "catppuccin",
          component_separators = { left = '│', right = '│'},
          section_separators = { left = '󰅂', right = '󰅁'},
        }
      })

      -- ── Bufferline ───────────────────────────────────────────────────
      require("bufferline").setup({
        options = {
          diagnostics = "nvim_lsp",
          separator_style = "slant",
        }
      })

      -- ── Which-Key ───────────────────────────────────────────────────
      require("which-key").setup({})

      -- ── Nvim-Tree ────────────────────────────────────────────────────
      require("nvim-tree").setup({
        sort_by = "case_sensitive",
        view = { width = 30 },
        renderer = { group_empty = true },
        filters = { dotfiles = false },
      })
      vim.keymap.set('n', '<C-n>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

      -- ── Telescope ───────────────────────────────────────────────────
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Find Files' })
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Live Grep' })
      vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Find Buffers' })
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Help Tags' })

      -- ── Gitsigns ────────────────────────────────────────────────────
      require("gitsigns").setup()

      -- ── Comment.nvim ────────────────────────────────────────────────
      require("comment").setup()

      -- ── Nvim-Cmp Auto-Completion ────────────────────────────────────
      local cmp = require('cmp')
      local luasnip = require('luasnip')

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
          ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { 'i', 's' }),
          ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { 'i', 's' }),
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
        }, {
          { name = 'buffer' },
          { name = 'path' },
        })
      })

      -- ── LSP Configurations ──────────────────────────────────────────
      local lspconfig = require('lspconfig')
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      -- Nix Language Server
      lspconfig.nixd.setup({ capabilities = capabilities })

      -- C / C++ Language Server
      lspconfig.clangd.setup({ capabilities = capabilities })

      -- Python Language Server
      lspconfig.pyright.setup({ capabilities = capabilities })

      -- Rust Language Server
      lspconfig.rust_analyzer.setup({ capabilities = capabilities })
    '';
  };
}
