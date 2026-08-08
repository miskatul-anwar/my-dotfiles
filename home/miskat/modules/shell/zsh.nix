# Zsh & Powerlevel10k configuration
{ pkgs, ... }:
{
  programs.zoxide.enableZshIntegration = true;

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    autosuggestion.enable = true;

    plugins = [
      {
        name = "powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }
    ];

    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "sudo"
        "z"
        "history"
        "command-not-found"
        "extract"
      ];
    };

    history = {
      size = 5000;
      save = 5000;
      path = "$HOME/.zsh_history";
    };

    shellAliases = {
      # Navigation
      cls  = "clear";
      ".." = "cd ..";
      "..." = "cd ../..";
      "~"  = "cd ~";

      # NixOS rebuild (Single Unified Profile)
      update   = "nh os switch";
      rebuild  = "nh os switch";
      hm       = "home-manager switch --flake ~/my-dotfiles#miskat";
      editcfg  = "nvim ~/my-dotfiles";

      # Git & GitHub AI
      gs      = "git status";
      ga      = "git add .";
      gc      = "git commit";
      gp      = "git push";
      gl      = "git log --oneline --graph --decorate";
      # AI / Copilot CLI
      copilot  = "gh copilot";
      ghcs     = "gh copilot suggest";
      ghce     = "gh copilot explain";

      # Nix helpers
      nix-clean  = "nh clean all";
      nix-search = "nix search nixpkgs";
      nix-up     = "nix flake update ~/my-dotfiles";

      # ls replacements (using lsd)
      ls = "lsd";
      ll = "lsd -lh";
      la = "lsd -lha";
    };

    initContent = ''
      [[ -r "''${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-''${USER}.zsh" ]] && source "''${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-''${USER}.zsh"
      [[ -f "$HOME/.p10k.zsh" ]] && source "$HOME/.p10k.zsh"
      [[ -f "$HOME/.hf_token" ]] && export HF_TOKEN="$(cat "$HOME/.hf_token")"
      export PATH="$HOME/.local/bin:$HOME/.npm-global/bin:$PATH"
      fastfetch
    '';
  };
}
