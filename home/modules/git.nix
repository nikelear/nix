{ pkgs, ... }:
{
  programs.git = {
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
      ".envrc"
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
}
