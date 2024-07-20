{ pkgs, nixos-wsl, ... }:

{

  imports = [
    # include NixOS-WSL modules
    nixos-wsl.nixosModules.wsl
  ];
  
  wsl = {
    enable = true;
    defaultUser = "nikelear";
    wslConf = {
      interop.appendWindowsPath = false;
    };
  };

  programs = {
    nix-ld = {
      enable = true;
      package = pkgs.nix-ld-rs;
    };
  };

}
