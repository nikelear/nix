{ ... }:
{
  programs.zsh = {
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
    initExtra = ''
      bindkey '^N' history-substring-search-backward
      bindkey '^P' history-substring-search-forward
      source '' + zsh/sh/zsh-vim.sh
      + '''';
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
        "rebuild" = "sudo nixos-rebuild switch --flake ~/nix/#%";
        "rehome" = "home-manager switch --flake ~/nix/#%";
      };
    };
    oh-my-zsh = {
      enable = false;
    };
  };

}

