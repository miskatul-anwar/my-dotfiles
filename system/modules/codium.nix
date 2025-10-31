{config, pkgs, ...}: {
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    extensions = with pkgs.vscode-extensions; [
      asvetliakov.vscode-neovim
      jnoortheen.nix-ide
      llvm-vs-code-extensions.vscode-clangd
      github.github-vscode-theme
      rust-lang.rust-analyzer
      pylyzer.pylyzer
      usernamehw.errorlens
      christian-kohler.path-intellisense
      formulahendry.code-runner
      pkief.material-icon-theme
      zguolee.tabler-icons
    ];
  };
}
