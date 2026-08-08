# Neovim Master Keymaps Configuration
{ ... }:
{
  programs.nixvim.keymaps = [
    # Clear Search Highlights
    {
      mode = "n";
      key = "<Esc>";
      action = "<cmd>nohlsearch<CR>";
      options = { silent = true; desc = "Clear Search Highlights"; };
    }

    # Window Movement Shortcuts (Ctrl + HJKL)
    {
      mode = "n";
      key = "<C-h>";
      action = "<C-w>h";
      options = { silent = true; desc = "Move to Left Window"; };
    }
    {
      mode = "n";
      key = "<C-j>";
      action = "<C-w>j";
      options = { silent = true; desc = "Move to Lower Window"; };
    }
    {
      mode = "n";
      key = "<C-k>";
      action = "<C-w>k";
      options = { silent = true; desc = "Move to Upper Window"; };
    }
    {
      mode = "n";
      key = "<C-l>";
      action = "<C-w>l";
      options = { silent = true; desc = "Move to Right Window"; };
    }

    # Buffer Navigation Shortcuts (Shift + H/L)
    {
      mode = "n";
      key = "<S-h>";
      action = "<cmd>BufferLineCyclePrev<CR>";
      options = { silent = true; desc = "Previous Buffer"; };
    }
    {
      mode = "n";
      key = "<S-l>";
      action = "<cmd>BufferLineCycleNext<CR>";
      options = { silent = true; desc = "Next Buffer"; };
    }
    {
      mode = "n";
      key = "<leader>bd";
      action = "<cmd>bdelete<CR>";
      options = { silent = true; desc = "Delete Current Buffer"; };
    }

    # File Explorer Toggle (<C-n> & <leader>e)
    {
      mode = "n";
      key = "<C-n>";
      action = "<cmd>NvimTreeToggle<CR>";
      options = { silent = true; desc = "Toggle NvimTree Explorer"; };
    }
    {
      mode = "n";
      key = "<leader>e";
      action = "<cmd>NvimTreeToggle<CR>";
      options = { silent = true; desc = "Toggle NvimTree Explorer"; };
    }

    # Code Formatting
    {
      mode = "n";
      key = "<leader>fm";
      action.__raw = "function() vim.lsp.buf.format() end";
      options = { silent = true; desc = "Format Document"; };
    }
  ];
}
