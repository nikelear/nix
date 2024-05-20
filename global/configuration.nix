# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

# NixOS-WSL specific options are documented on the NixOS-WSL repository:
# https://github.com/nix-community/NixOS-WSL

{ config, lib, pkgs, nixos-wsl, ... }:

let
  # isWSL = builtins.pathExists "/usr/lib/wsl/lib";
  # isPersonal = builtins.getEnv "WSL_RUNNING_USER" == "C:\\Users\\Aether";
  isPersonal = false;
in

{
  imports = [
    # include NixOS-WSL modules
    nixos-wsl.nixosModules.wsl
  ] ++ (
    if ! isPersonal then [ ./proxy.nix ] else []
  );

  time = {
    timeZone = "Asia/Tokyo";
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
