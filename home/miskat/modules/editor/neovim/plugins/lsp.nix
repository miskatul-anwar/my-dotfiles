# Neovim LSP (Language Server Protocol) Configuration
{ ... }:
{
  programs.nixvim.plugins = {
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
        gopls.enable = true;
        html.enable = true;
        cssls.enable = true;
        jsonls.enable = true;
      };

      keymaps.lspBuf = {
        "gd" = "definition";
        "gD" = "declaration";
        "gi" = "implementation";
        "gr" = "references";
        "K"  = "hover";
        "<leader>rn" = "rename";
        "<leader>ca" = "code_action";
      };
    };

    lsp-format.enable = true;

    lspkind = {
      enable = true;
      settings.symbol_map = {
        Text = "󰉿";
        Method = "󰆧";
        Function = "󰊕";
        Constructor = "";
        Field = "󰜢";
        Variable = "󰀫";
        Class = "󰠱";
        Interface = "";
        Module = "";
        Property = "󰜢";
        Unit = "󰑭";
        Value = "󰎠";
        Enum = "";
        Keyword = "󰌋";
        Snippet = "";
        Color = "󰏘";
        File = "󰈙";
        Reference = "󰈇";
        Folder = "󰉋";
        EnumMember = "";
        Constant = "󰏿";
        Struct = "󰙅";
        Event = "";
        Operator = "󰆕";
        TypeParameter = "";
      };
    };
  };
}
