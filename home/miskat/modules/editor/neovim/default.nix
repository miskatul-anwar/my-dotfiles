# Declarative Nixvim Module — github:nix-community/nixvim
{ inputs, ... }:
{
  imports = [
    ./options.nix
    ./keymaps.nix
    ./theme.nix
    ./plugins
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    nixpkgs.source = inputs.nixpkgs;
  };
}
