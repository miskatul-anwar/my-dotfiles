{ pkgs, ... }:

{
  programs.starship.enable = true;
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
      theme = "robbyrussell"; # or "agnoster", "powerlevel10k" (if installed)
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
      export EDITOR="nvim"
      eval "$(starship init zsh)"
      fastfetch
    '';
  };

  # Set zsh as default shell for your session
  home.sessionVariables.SHELL = "${pkgs.zsh}/bin/zsh";

  home.file.".config/starship.toml".text = ''
    # Don't print a new line at the start of the prompt
    add_newline = false
    # Pipes ╰─ ╭─
    # Powerline symbols                                     
    # Wedges 🭧🭒 🭣🭧🭓
    # Random noise 🬖🬥🬔🬗

    # format = """
    # $cmd_duration$username$hostname $directory $git_branch
    # $character
    # """
    format = """
    $cmd_duration$directory $git_branch
    $character
    """

    # Replace the "❯" symbol in the prompt with "➜"
    [character]                            # The name of the module we are configuring is "character"
    success_symbol = "[• ](bold fg:green) "
    error_symbol = "[• 󰅙](bold fg:red) "

    # Disable the package module, hiding it from the prompt completely
    [package]
    disabled = true

    [git_branch]
    style = "bg: green"
    symbol = "󰘬"
    truncation_length = 4
    truncation_symbol = ""
    format = "• [](bold fg:green)[$symbol $branch(:$remote_branch)](fg:black bg:green)[ ](bold fg:green)"

    [git_commit]
    commit_hash_length = 4
    tag_symbol = " "

    [git_state]
    format = '[\($state( $progress_current of $progress_total)\)]($style) '
    cherry_pick = "[🍒 PICKING](bold red)"

    [git_status]
    conflicted = " 🏳 "
    ahead = " 🏎💨 "
    behind = " 😰 "
    diverged = " 😵 "
    untracked = " 🤷 ‍"
    stashed = " 📦 "
    modified = " 📝 "
    staged = '[++\($count\)](green)'
    renamed = " ✍️ "
    deleted = " 🗑 "

    [hostname]
    ssh_only = false
    format =  "[•$hostname](bg:cyan bold fg:black)[](bold fg:cyan )"
    trim_at = ".companyname.com"
    disabled = false

    [line_break]
    disabled = false

    [memory_usage]
    disabled = true
    threshold = -1
    symbol = " "
    style = "bold dimmed green"

    [time]
    disabled = true
    format = '🕙[\[ $time \]]($style) '
    time_format = "%T"

    [username]
    style_user = "bold bg:cyan fg:black"
    style_root = "red bold"
    format = "[](bold fg:cyan)[$user]($style)"
    disabled = false
    show_always = true

    [directory]
    home_symbol = "  "
    read_only = "  "
    style = "bg:green fg:black"
    truncation_length = 6
    truncation_symbol = "••/"
    format = '[](bold fg:green)[$path ]($style)[](bold fg:green)'


    [directory.substitutions]
    "Desktop" = "  "
    "Documents" = "  "
    "Downloads" = "  "
    "Music" = " 󰎈 "
    "Pictures" = "  "
    "Videos" = "  "

    [cmd_duration]
    min_time = 0
    format = '[](bold fg:yellow)[ $duration](bold bg:yellow fg:black)[](bold fg:yellow) •• '
  '';
}

