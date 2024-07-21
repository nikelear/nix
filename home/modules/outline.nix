{ pkgs, ... }:

{

  programs = {

    home-manager.enable = true;

    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };

  };

}
