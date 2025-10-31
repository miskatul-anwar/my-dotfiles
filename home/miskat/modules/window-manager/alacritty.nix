{ config, pkgs, lib, ... }:

{
  programs.alacritty = {
    enable = true;

    settings = {
      import = [
        "${pkgs.vimPlugins.nightfox-nvim}/extra/carbonfox/nightfox_alacritty.yml"
      ];

      font = {
        normal = {
          family = "Hack";
          style = "Medium";
        };
        size = 12;
      };

      window = {
        padding = {
          x = 12;
          y = 12;
        };
      };

      shell = {
        # Use the Nix-provided Zsh for reproducibility.
        program = "${pkgs.zsh}/bin/zsh";
      };
    };
  };
}