{
  systemd = {
    services = {
      nix-daemon = {
        environment = {
          "https_proxy" = "http://tyo4.sme.zscaler.net:443";
        };
      };
    };
  };
  environment = {
    sessionVariables = {
      "http_proxy" = "http://tyo4.sme.zscaler.net:80";
      "https_proxy" = "http://tyo4.sme.zscaler.net:443";
      "ftp_proxy" = "http://tyo4.sme.zscaler.net:21";
      "no_proxy" = "localhost,127.0.0.1";
    };
  };
  security = {
    pki = {
      certificateFiles = [
        /etc/ssl/certs/certs.pem
      ];
    };
  };
  fileSystems = {
    "/mnt/z" = {
      device = "Z:";
      fsType = "drvfs";
      options = [ "defaults" ];
    };
    "/mnt/n" = {
      device = "N:";
      fsType = "drvfs";
      options = [ "defaults" ];
    };
    "/mnt/m" = {
      device = "M:";
      fsType = "drvfs";
      options = [ "defaults" ];
    };
    "/mnt/p" = {
      device = "P:";
      fsType = "drvfs";
      options = [ "defaults" ];
    };
    "/mnt/t" = {
      device = "T:";
      fsType = "drvfs";
      options = [ "defaults" ];
    };
  };
}
