{ pkgs, ... }:
{
  programs.starship = {
    enable = true;
    enableZshIntegration = true;

    settings = {
      add_newline = false;

      format = "$username$hostname$directory$git_branch$git_status$python$rust$cmd_duration\n$character";

      character = {
        success_symbol = "[❯](bold #f3be53)";
        error_symbol   = "[❯](bold #ff5555)";
        vimcmd_symbol  = "[❮](bold #f3be53)";
      };

      username = {
        style_user  = "bold #e6c368";
        style_root  = "bold #ff5555";
        format      = "[$user]($style) ";
        show_always = false;
      };

      hostname = {
        ssh_only = true;
        format   = "@[$hostname](bold #f3be53) ";
      };

      directory = {
        style             = "bold #f3be53";
        truncation_length = 4;
        truncation_symbol = "…/";
        home_symbol       = "󰋜 ~";
        read_only         = " 󰌾";
        format            = "[$path]($style)[$read_only]($read_only_style) ";
        substitutions = {
          "Documents" = "󰈙 Documents";
          "Downloads" = "󰇚 Downloads";
          "Music"     = "󰎈 Music";
          "Pictures"  = "󰋩 Pictures";
          "Videos"    = "󰕧 Videos";
          "Desktop"   = "󰧨 Desktop";
        };
      };

      git_branch = {
        symbol = "󰘬 ";
        style  = "bold #ffd700";
        format = "on [$symbol$branch]($style) ";
      };

      git_status = {
        style  = "bold #ff5555";
        format = "([$all_status$ahead_behind]($style) )";
      };

      cmd_duration = {
        min_time = 2000;
        style    = "bold #f7c04a";
        format   = "took [$duration]($style) ";
      };

      python = {
        symbol = "󰌠 ";
        style  = "bold #e6c368";
        format = "via [$symbol($version )]($style)";
      };

      rust = {
        symbol = "󱌣 ";
        style  = "bold #f3be53";
        format = "via [$symbol($version )]($style)";
      };

      package = {
        disabled = true;
      };
    };
  };

  programs.zoxide.enableZshIntegration = true;

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    autosuggestion.enable = true;

    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
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

      # NixOS rebuild (zero arguments required — defaults to ~/my-dotfiles#miskat)
      update   = "nh os switch";
      rebuild  = "nh os switch";
      hm       = "home-manager switch --flake ~/my-dotfiles#miskat";
      editcfg  = "nvim ~/my-dotfiles";

      # Git
      gs  = "git status";
      ga  = "git add .";
      gc  = "git commit";
      gp  = "git push";
      gl  = "git log --oneline --graph --decorate";

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
      [[ -f "$HOME/.hf_token" ]] && export HF_TOKEN="$(cat "$HOME/.hf_token")"
      fastfetch
    '';
  };
}
