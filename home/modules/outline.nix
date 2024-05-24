{ pkgs, ... }:

{

  home = rec {
    username = "nikelear";
    homeDirectory = "/home/${username}";
  };

  home = {
    stateVersion = "23.11";
    packages = [
      pkgs.ghq
      pkgs.eza
      pkgs.bat
      pkgs.ripgrep
      # pkgs.vim
      # pkgs.git
    ];
    sessionPath = [
      "$HOME/.local/bin"
    ];
    sessionVariables = {
      ABBR_SET_EXPANSION_CURSOR = 1;
      ABBR_SET_LINE_CURSOR = 1;
    };
    file = {
      ".local/bin/phonetic-game" = {
        executable = true;
        source = ../../scripts/phonetic.sh;
      };
      ".local/bin/colcode" = {
        executable = true;
        source = ../../scripts/colorcode.sh;
      };
    };
  };

}
