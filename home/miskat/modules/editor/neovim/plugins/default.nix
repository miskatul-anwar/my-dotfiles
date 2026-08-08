# Neovim Plugins Master Submodule Entry Point
{ ... }:
{
  imports = [
    ./lsp.nix
    ./cmp.nix
    ./treesitter.nix
    ./ui.nix
    ./git.nix
    ./navigation.nix
    ./utils.nix
  ];
}
