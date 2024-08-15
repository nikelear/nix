{ pkgs, ... }:
{

  imports = [
    modules/zsh.nix
    modules/git.nix
    modules/vim.nix
    modules/tmux.nix
  ];

  home = rec {
    stateVersion = "24.05";
    username = "nikelear";
    homeDirectory = "/home/${username}";

    packages = with pkgs; [
      nix
      wget
      ghq
      eza
      bat
      fzf
      zsh-fzf-tab
      ripgrep
      hyperfine
      lazygit
      lazydocker
    ];
    sessionPath = [
      "$HOME/.local/bin"
    ];
    sessionVariables = {
      ABBR_SET_EXPANSION_CURSOR = 1;
      ABBR_SET_LINE_CURSOR = 1;
      EDITOR = "${pkgs.vim}/bin/vim";
      FPATH = "${
        pkgs.buildEnv {
          name = "zsh-comp";
          paths = packages;
          pathsToLink = "/share/zsh";
        }
      }/share/zsh/site-functions";
    };
    file = {
      ".local/bin/phonetic-game" = {
        executable = true;
        source = ../scripts/phonetic.sh;
      };
      ".local/bin/colcode" = {
        executable = true;
        source = ../scripts/colorcode.sh;
      };
    };
  };

  programs.home-manager.enable = true;

}
