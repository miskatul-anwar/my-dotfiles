# Niri + Dank Material Shell Desktop Module Entry Point
{ inputs, ... }:
{
  imports = [
    ./config.nix
  ] ++ (
    if (builtins.hasAttr "dank-material-shell" inputs && builtins.hasAttr "homeModules" inputs.dank-material-shell) then [
      inputs.dank-material-shell.homeModules.dank-material-shell
    ] else []
  );

  # Enable Dank Material Shell if module is loaded
  programs.dank-material-shell = {
    enable = true;
  };
}
