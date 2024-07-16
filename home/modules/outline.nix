{ pkgs, ... }:

{

  home = {
    packages = with pkgs; [
      wget
      ghq
      eza
      bat
      ripgrep
      hyperfine
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
