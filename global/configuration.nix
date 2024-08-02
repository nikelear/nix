# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

# NixOS-WSL specific options are documented on the NixOS-WSL repository:
# https://github.com/nix-community/NixOS-WSL

{ config, lib, pkgs, nixos-wsl, ... }:

{
  imports = [];

  time = {
    timeZone = "Asia/Tokyo";
  };

  networking = {
    hostName = "Astrolabe";
  };

  nix = { 
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
  };

  security = {
    sudo = {
      enable = true;
      wheelNeedsPassword = true;
    };
  };

  environment = {
    sessionVariables = {
      RSYNC_RSH = "ssh";
    };
    variables = {
      "XDG_CONFIG_HOME" = "$HOME/.config";
      "XDG_CACHE_HOME" = "$HOME/.cache";
      "XDG_DATA_HOME" = "$HOME/.local/share";
      "XDG_STATE_HOME" = "$HOME/.local/state";
    };
    systemPackages = with pkgs; [
    ];
  };

  users = {
    users.nikelear = {
      isNormalUser = true;
      extraGroups = [ "networkmanager" "wheel" ];
      packages = with pkgs; [];
    };
  };

  virtualisation.docker.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?
}
