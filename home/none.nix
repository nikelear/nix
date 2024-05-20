{

  home = rec {
    username = "nikelear";
    homeDirectory = "/home/${username}";
    stateVersion = "23.11";
  };
  
  packages = {
    home-manager.enable = true;
  };

}
