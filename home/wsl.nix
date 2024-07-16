{ ... }:

{
  programs = {
    # starship.enable = true;
    git = {
      extraConfig = {
        credential = {
          helper = "/mnt/c/Program\\ Files/Git/mingw64/bin/git-credential-manager.exe";
        };
      };
    }; 
  };
}
