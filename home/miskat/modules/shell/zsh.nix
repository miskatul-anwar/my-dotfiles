{ pkgs, ... }:
{
  programs.starship = {
    enable = true;
    enableZshIntegration = true;

    settings = {
      add_newline = false;

      format = "$username$hostname$directory$git_branch$git_status$python$rust$cmd_duration\n$character";

      character = {
        success_symbol = "[❯](bold #a6e3a1)";
        error_symbol   = "[❯](bold #f38ba8)";
        vimcmd_symbol  = "[❮](bold #a6e3a1)";
      };

      username = {
        style_user  = "bold #cba6f7";
        style_root  = "bold #f38ba8";
        format      = "[$user]($style) ";
        show_always = false;
      };

      hostname = {
        ssh_only = true;
        format   = "@[$hostname](bold #89b4fa) ";
      };

      directory = {
        style             = "bold #89b4fa";
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
        style  = "bold #f5c2e7";
        format = "on [$symbol$branch]($style) ";
      };

      git_status = {
        style  = "bold #f38ba8";
        format = "([$all_status$ahead_behind]($style) )";
      };

      cmd_duration = {
        min_time = 2000;
        style    = "bold #f9e2af";
        format   = "took [$duration]($style) ";
      };

      python = {
        symbol = "󰌠 ";
        style  = "bold #e5c07b";
        format = "via [$symbol($version )]($style)";
      };

      rust = {
        symbol = "󱌣 ";
        style  = "bold #e06c75";
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
      fastfetch
    '';
  };
}
