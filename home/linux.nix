{ pkgs, ...}:
{
  dconf.settings = {
    "org/gnome/desktop/input-sources/xkb-options" = [
    'ctrl:nocaps'
    ];
    "org/gnome/desktop/interface" = {
      clock-show-weekday = true;
    };
  }
  programs = {
    firefox = {
      enable = true;
    };
    vscode = {
      enable = true;
    };
    alacritty = {
      enable = true;
      settings = {
        shell = {
          args = [
            "tmux attach || tmux"
          ];
        };
      };
    };
  };
}

