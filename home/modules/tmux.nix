{ pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    shell = "${pkgs.zsh}/bin/zsh";
    terminal = "tmux-256color";
    extraConfig = ''
      set -ag terminal-overrides ",xterm-256color:Tc"
      ${builtins.readFile ./tmux/tmux.conf}
    '';
  };
}
