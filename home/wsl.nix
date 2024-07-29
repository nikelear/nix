{ ... }:

{
  programs = {
    git = {
      extraConfig = {
        credential = {
          helper = "/mnt/c/Program\\ Files/Git/mingw64/bin/git-credential-manager.exe";
        };
      };
    }; 
  };
  home = {
    file = {
      ".local/bin/cmd" = {
        executable = true;
        source = ../scripts/cmd.sh;
      };
      ".local/bin/firefox" = {
        executable = true;
        source = ../scripts/firefox.sh;
      };
      ".local/bin/code" = {
        executable = true;
        source = ../scripts/code.sh;
      };
    };
  };

}
