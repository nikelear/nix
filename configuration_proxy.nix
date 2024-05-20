# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

# NixOS-WSL specific options are documented on the NixOS-WSL repository:
# https://github.com/nix-community/NixOS-WSL

{ config, lib, pkgs, nixos-wsl, ... }:

{
  imports = [
    # include NixOS-WSL modules
    nixos-wsl.nixosModules.wsl
  ];

  time = {
    timeZone = "Asia/Tokyo";
  };

  networking = {
    hostName = "Astrolabe";
  };

  # systemd = {
  #   services = {
  #     nix-daemon = {
  #       environment = {
  #         "https_proxy" = "http://tyo4.sme.zscaler.net:443";
  #       };
  #     };
  #   };
  # };

  nix = { 
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
  };

  wsl = {
    enable = true;
    defaultUser = "nikelear";
    interop.includePath = false;
  };

  security = {
    sudo = {
      enable = true;
    };
    pki = {
      certificateFiles = [
        /etc/ssl/certs/certs.pem
      ];
    };
  };

  environment = {
    sessionVariables = {
      "http_proxy" = "http://tyo4.sme.zscaler.net:80";
      "https_proxy" = "http://tyo4.sme.zscaler.net:443";
      "ftp_proxy" = "http://tyo4.sme.zscaler.net:21";
      "no_proxy" = "localhost,127.0.0.1";
      "XDG_CONFIG_DIR" = "$HOME/.config";
    };
    variables = {
      RSYNC_RSH = "ssh";
      EDITOR = "vim";
    };
    systemPackages = with pkgs; [
      git
      vim
      wget
      curl
    ];
  };

  users = {
    users.nikelear = {
      shell = pkgs.zsh;
      isNormalUser = true;
      extraGroups = [ "wheel" ];
    };
  };

  programs = {
    zsh.enable = true;
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?
}
