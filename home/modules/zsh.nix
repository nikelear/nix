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

    initExtra = ''
      bindkey '^N' history-substring-search-backward
      bindkey '^P' history-substring-search-forward
      source ${sh/prompt.sh}
      source ${sh/function.sh}
      source ${pkgs.zsh-fzf-tab}/share/fzf-tab/fzf-tab.plugin.zsh
    '';

    shellAliases = {
      "cat" = "bat";
    };

    zsh-abbr = {
      enable = true;
      abbreviations = {
        ".." = "cd ..";
        "..2" = "cd .. && cd ..";
        "..3" = "cd .. && cd .. && cd ..";
        "ga" = "git add";
        "ga." = "git add .";
        "gco" = "git checkout";
        "gcm" = "git commit -m \"%\"";
        "gca" = "git commit --amend";
        "gd" = "git diff";
        "gdh" = "git diff HEAD";
        "gps" = "git push";
        "gpl" = "git pull";
        "l" = "ls -CF";
        "la" = "ls -aCF";
        "ll" = "ls -lF";
        "lla" = "ls -laF";
        "mm" = "mkdir -p % && cd $_";
        "nd" = "nix develop -c zsh";
        "nsp" = "nix shell nixpkgs#%";
        "reload" = "exec $SHELL -l";
        "rebuild" = "sudo nixos-rebuild switch --flake ~/nix/#%";
        "rehome" = "home-manager switch --flake ~/nix/#%";
      };
    };
  };
}
