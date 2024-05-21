{ pkgs, ... }:
{

  home = rec {
    username = "nikelear";
    homeDirectory = "/home/${username}";
    stateVersion = "23.11";
    packages = [
      pkgs.ghq
      pkgs.eza
      pkgs.bat
      pkgs.ripgrep
    ];
  };

  programs = {

    home-manager.enable = true;

    vim = {
      enable = true;
      defaultEditor = true;
      extraConfig = ''
        set number
        set relativenumber
      '';
    };

    git = {
      enable = true;
      userEmail = "nike.lear@gmail.com";
      userName = "nikelear";
      delta = {
        enable = true;
        options = {
          line-numbers = true;
          side-by-side = true;
          navigate = true;
        };
      };
      extraConfig = {
        commit = {
          verbose = true;
        };
        init = {
          defaultBranch = "main";
        };
        merge = {
          ff = false;
          conflictstyle = "diff3";
        };
        pull = {
          ff = only;
          rebase = true;
        };
        push = {
          useForceIfIncludes = true;
        };
        ghq = {
          root = "~/.local/share/ghq";
        };
      };
      ignores = [
        # mac
        "._*"
        ".DS_Store"

        # system
        "*~"
        ".direnv"
        ".vscode"
        ".idea"
        "*.swp"
        "*.zwc"
        "*.log"

        # output
        "target"
        "result"

        # c
        "compile_commands.json"
        "compile_flags.txt"
      ];
    };

    starship.enable = true;
    zsh = {
      enable = true;
      dotDir = ".config/zsh";
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      history = {
        save = 100000;
        size = 100000;
        path = "$ZDOTDIR/.zsh_history";
        ignoreAllDups = true;
        ignorePatterns = [
          "pwd"
          "cd*"
          "rm *"
          "cp *"
          "ls *"
          "git add ."
          "git commit -m*"
        ];
      };
      shellAliases = {};
      zsh-abbr = {
        enable = true;
        abbreviations = {
          ".." = "cd ..";
          "..." = "cd .. && cd ..";
          "ga" = "git add";
          "ga." = "git add .";
          "gdh" = "git diff HEAD";
          "gcm" = "git commit -m \"%\"";
          "gca" = "git commit --amend";
          "gp" = "git push";
          "reload" = "exec $SHELL -l";
          "rebuild" = "sudo nixos-rebuild switch --flake .#%";
          "rehome" = "home-manager switch --flake .#%";
        };
      };
    };
  };

  home = {
    sessionVariables = {
      ABBR_SET_EXPANSION_CURSOR = 1;
      ABBR_SET_LINE_CURSOR = 1;
    };
  };

}
