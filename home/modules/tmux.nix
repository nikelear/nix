{ pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    clock24 = true;
    shell = "${pkgs.zsh}/bin/zsh";
    terminal = "tmux-256color";
    # newSession = true;
    mouse = true;
    keyMode = "vi";
    extraConfig = ''
      set -ag terminal-overrides ",xterm-256color:Tc"
    '';
  };
}