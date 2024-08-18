{ pkgs, ...}:
{
  home = {
    packages = with pkgs; [
      xclip
    ];
  };
  dconf.settings = {
    "org/gnome/shell" = {
      favorite-apps = [
        "firefox.desktop"
        "org.gnome.Epiphany.desktop"
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
    git-credential-oauth.enable = true;
    firefox.enable = true;
    vscode.enable = true;
  };
}

