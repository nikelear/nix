{

  wsl = {
    enable = true;
    defaultUser = "nikelear";
    wslConf = {
      boot.systemd = true;
      interop.appendWindowsPath = false;
    };
  };

}
