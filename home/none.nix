{

  home = rec {
    username = "nikelear";
    homeDirectory = "/home/${username}";
    stateVersion = "23.11";
  };
  
  programs = {
    home-manager.enable = true;
    zsh = {
      enable = true;
      dotDir = ".config/zsh";
      history = {
        save = 100000;
        size = 100000;
        path = "$ZDOTDIR/.zsh_history";
        ignoreAllDups = true;
        ignorePatterns = [
          "cd*"
          "pwd"
          "rm *"
          "cp *"
        ];
      };
    };
  };

}
