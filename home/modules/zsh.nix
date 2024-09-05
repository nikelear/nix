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
      autoload history-search-end
      zle -N history-beginning-search-backward-end history-search-end
      zle -N history-beginning-search-forward-end history-search-end
      bindkey '^n' history-beginning-search-backward
      bindkey '^p' history-beginning-search-forward

      source ${sh/prompt.sh}
      source ${sh/function.sh}
      source ${pkgs.zsh-fzf-tab}/share/fzf-tab/fzf-tab.plugin.zsh
      setopt print_eight_bit
      setopt print_exit_value
      zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
    '';

    shellAliases = {
    };

    zsh-abbr = {
      enable = true;
      abbreviations = {
        ".." = "cd ..";
        "..2" = "cd .. && cd ..";
        "..3" = "cd .. && cd .. && cd ..";
        "ee" = "cd ~/nix";
        "ev" = "cd ~/nix && nvim .";
        "ga" = "git add";
        "ga." = "git add .";
        "gap" = "git add -p";
        "gco" = "git checkout";
        "gcm" = "git commit -m \"%\"";
        "gca" = "git commit --amend";
        "gd" = "git diff";
        "gdh" = "git diff HEAD";
        "gds" = "git diff HEAD~1 HEAD";
        "gps" = "git push";
        "gpl" = "git pull";
        "l" = "ls -CF";
        "la" = "ls -aCF";
        "ll" = "ls -lF";
        "lla" = "ls -laF";
        "mm" = "mkdir -p % && cd $_";
        "v" = "nvim";
        "vv" = "nvim .";
        "nb" = "nix build";
        "nd" = "nix develop -c zsh";
        "nr" = "nix run";
        "nsp" = "nix shell nixpkgs#%";
        "reload" = "exec $SHELL -l";
        "rebuild" = "sudo nixos-rebuild switch --flake ~/nix/#%";
        "rehome" = "home-manager switch --flake ~/nix/#%";
      };
    };
  };
}
