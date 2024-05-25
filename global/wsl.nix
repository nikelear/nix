{

  imports = [
    # include NixOS-WSL modules
    nixos-wsl.nixosModules.wsl
  ];
  
  wsl = {
    enable = true;
    defaultUser = "nikelear";
    wslConf = {
      # boot.systemd = true;
      interop.appendWindowsPath = false;
    };
  };

}
