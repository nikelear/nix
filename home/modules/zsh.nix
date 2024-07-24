{ pkgs, ... }:
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
    initExtraFirst = ''
      fpath+=(${pkgs.nix}/share/zsh/site-functions/ $fpath)
    '';

    initExtra = ''
      bindkey '^N' history-substring-search-backward
      bindkey '^P' history-substring-search-forward
      source ${sh/prompt.sh}
      source ${pkgs.zsh-fzf-tab}/share/fzf-tab/fzf-tab.plugin.zsh
    '';

    shellAliases = {
      "cat" = "bat";
    };

    zsh-abbr = {
      enable = true;
      abbreviations = {
        ".." = "cd ..";
        "..." = "cd .. && cd ..";
        "nd" = "nix develop";
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
  };
}

