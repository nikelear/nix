{ pkgs, ... }:
{

  imports = [
    modules/outline.nix
    modules/zsh.nix
    modules/git.nix
    modules/vim.nix
    modules/tmux.nix
  ];

  home = rec {
    stateVersion = "24.05";
    username = "nikelear";
    homeDirectory = "/home/${username}";
  };

  home = {
    packages = with pkgs; [
      wget
      ghq
      eza
      bat
      fzf
      zsh-fzf-tab
      ripgrep
      hyperfine
    ];
    sessionPath = [
      "$HOME/.local/bin"
    ];
    sessionVariables = {
      ABBR_SET_EXPANSION_CURSOR = 1;
      ABBR_SET_LINE_CURSOR = 1;
      EDITOR = "${pkgs.vim}/bin/vim";
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

}
