# Neovim Auto-Completion Engine Configuration
{ ... }:
{
  programs.nixvim.plugins = {
    cmp = {
      enable = true;
      autoEnableSources = true;
      settings = {
        snippet.expand = "function(args) require('luasnip').lsp_expand(args.body) end";
        sources = [
          { name = "nvim_lsp"; }
          { name = "luasnip"; }
          { name = "path"; }
          { name = "buffer"; }
          { name = "nvim_lua"; }
        ];
        mapping = {
          "<C-Space>" = "cmp.mapping.complete()";
          "<C-d>"     = "cmp.mapping.scroll_docs(-4)";
          "<C-f>"     = "cmp.mapping.scroll_docs(4)";
          "<CR>"      = "cmp.mapping.confirm({ select = true })";
          "<Tab>"     = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
          "<S-Tab>"   = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
        };
      };
    };

    luasnip.enable = true;
    cmp-nvim-lsp.enable = true;
    cmp-nvim-lua.enable = true;
    cmp-path.enable = true;
    cmp-buffer.enable = true;
    cmp_luasnip.enable = true;
    friendly-snippets.enable = true;
  };
}
