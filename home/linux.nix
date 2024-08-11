{ pkgs, ...}:
{
  dconf.settings = {
    "org/gnome/shell" = {
      favorite-apps = [
        "firefox.desktop"
        "Alacritty.desktop"
        "code.desktop"
        "org.gnome.Console.desktop"
        "org.gnome.Nautilus.desktop"
        "org.gnome.TextEditor.desktop"
        "org.gnome.Geary.desktop"
        "org.gnome.Calendar.desktop"
      ];
    };
    "org/gnome/desktop/input-sources" = {
      xkb-options = "['ctrl:nocaps']";
    };
    "org/gnome/desktop/wm/preferences" = {
      button-layout = ":minimize,maximize,close";
    };
    "org/gnome/desktop/interface" = {
      clock-show-weekday = true;
    };
  };
  
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
        font = {
          normal = {
            family = "FiraCode Nerd Font Mono";
            style = "Regular";
          };
          bold.style = "Bold";
          italic.style = "Italic";
          bold_italic.style = "Bold Italic";
          size = 10;
        };
        window = {
          dimensions = {
            columns = 210;
            lines = 50;
          };
        };
        shell = {
          program = "${pkgs.zsh}/bin/zsh";
          args = [
            "-l"
            "-c"
            "tmux attach || tmux"
          ];
        };
      };
    };
  };
}

