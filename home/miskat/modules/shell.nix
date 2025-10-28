{ pkgs, ... }:

{
  programs.zoxide.enableZshIntegration = true;
  programs.zsh = {
    enable = true;
    enableCompletion = true;

    # Syntax highlighting + autosuggestions
    syntaxHighlighting.enable = true;
    autosuggestion.enable = true;

    # Oh My Zsh integration
    oh-my-zsh = {
      enable = true;
      theme = "agnoster"; # or "robbyrussell", "powerlevel10k" (if installed)
      plugins = [
        "git"
        "sudo"
        "z"
        "history"
        "command-not-found"
        "extract"
      ];
    };

    # Prompt & history behavior
    history = {
      size = 5000;
      save = 5000;
      path = "$HOME/.zsh_history";
    };

    # Default aliases
    shellAliases = {
      # Navigation
      cls = "clear";
      ".." = "cd ..";
      "..." = "cd ../..";
      "~" = "cd ~";

      # System
      update = "sudo nixos-rebuild switch --flake ~/nixos#$(whoami)";
      hm = "home-manager switch --flake ~/nixos";
      rebuild = "sudo nixos-rebuild switch --flake ~/nixos#$(whoami)";
      editcfg = "nvim ~/nixos";

      # Git
      gs = "git status";
      ga = "git add .";
      gc = "git commit";
      gp = "git push";
      gl = "git log --oneline --graph --decorate";

      # Nix
      nix-clean = "sudo nix-collect-garbage -d && nix-store --optimise";
      nix-search = "nix search nixpkgs";
      nix-up = "sudo nix flake update ~/nixos";

      # Misc
      ls = "lsd ";
      ll = "lsd -lh";
      la = "lsd -lha";
    };

    # Extra initialization (custom exports, etc.)
    initContent = ''
      neofetch
      export PATH=$HOME/.local/bin:$PATH
      export EDITOR="nvim"

    '';
  };

  # Set zsh as default shell for your session
  home.sessionVariables.SHELL = "${pkgs.zsh}/bin/zsh";
}

