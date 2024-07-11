{ pkgs, ... }:
{

  imports = [
    modules/outline.nix
    modules/zsh.nix
  ];

  home = rec {
    stateVersion = "24.05";
    username = "nikelear";
    homeDirectory = "/home/${username}";
  };

  programs = {

    home-manager.enable = true;

    tmux = {
      enable = true;
      clock24 = true;
      shell = "${pkgs.zsh}/bin/zsh";
      newSession = true;
      mouse = true;
      keyMode = "vi";
    };

    vim = {
      enable = true;
      defaultEditor = true;
      extraConfig = ''
        set number
        set relativenumber
      '';
    };
    neovim = {
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
          ff = "only";
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

  };

}
