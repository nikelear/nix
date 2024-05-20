{

  wsl = {
    enable = true;
    defaultUser = "nikelear";
    wslConf = {
      boot.systemd = true;
      network.hostname = "Astrolabe";
      interop.appendWindowsPath = false;
    };
  };

}
