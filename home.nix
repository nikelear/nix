{

  home = rec {
    username = "nikelear";
    homeDirectory = "/home/${username}";
    stateVersion = "23.11";
  };

  programs = {

    home-manager.enable = true;

    vim = {
      enable = true;
    };

    git = {
      enable = true;
      userEmail = "nike.lear@gmail.com";
      userName = "nikelear";
      delta = {
        enable = true;
        options = {
          line-numbers = true;
        };
      };
      
      pull = {
        rebase = true;
      };
      
      merge = {
        conflictstyle = "diff3";
      };
      
      init = {
        defaultBranch = "main";
      };

      ignores = [
        "target"
        ".vscode"
        ".direnv"
        "*~"
        "*.swp"
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
          "cd*"
          "pwd"
          "rm *"
          "cp *"
        ];
      };
      zsh-abbr = {
        enable = true;
        abbreviations = {
          ".." = "cd ..";
          "..." = "cd .. && cd ..";
          "ga" = "git add";
          "gcm" = "git commit -m \"%\"";
          "reload" = "exec $SHELL -l";
          "rebuild" = "cd ~/nix && sudo nixos-rebuild switch --flake .#%";
          "rehome" = "cd ~/nix && home-manager switch --flake .#%";
        };
      };
    };

  };

  home = {
    sessionVariables = {
      EDITOR = "vim";
      ABBR_SET_EXPANSION_CURSOR = 1;
      ABBR_SET_LINE_CURSOR = 1;
    };
  };
}
