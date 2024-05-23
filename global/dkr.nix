{
  security = {
    pki = {
      certificateFiles = [
        /etc/ssl/certs/certs.pem
      ];
    };
  };

  networking = {
    proxy = {
      default = "http://tyo4.sme.zscaler.net:80";
      noProxy = "127.0.0.1,localhost,internal.domain";
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
