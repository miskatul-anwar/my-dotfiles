# Neovim Core Vim Options
{ ... }:
{
  programs.nixvim = {
    globals.mapleader = " ";
    globals.maplocalleader = " ";

    opts = {
      # Line Numbers
      number = true;
      relativenumber = true;

      # Tabulation & Indentation
      shiftwidth = 2;
      tabstop = 2;
      softtabstop = 2;
      expandtab = true;
      smartindent = true;
      autoindent = true;

      # Line Wrapping
      wrap = false;

      # Search Settings
      ignorecase = true;
      smartcase = true;
      hlsearch = true;
      incsearch = true;

      # Appearance & Colors
      termguicolors = true;
      signcolumn = "yes";
      cursorline = true;
      scrolloff = 8;
      sidescrolloff = 8;

      # Timing & Performance
      updatetime = 250;
      timeoutlen = 300;

      # System Integration & Undo
      clipboard = "unnamedplus";
      undofile = true;
      swapfile = false;
      backup = false;

      # Splits & Windows
      splitbelow = true;
      splitright = true;
    };
  };
}
