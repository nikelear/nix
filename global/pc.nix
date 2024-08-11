# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports = [];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  console = {
    # keyMap = "jp106";

    useXkbConfig = true;
  };

  # Enable networking
  networking = {
    networkmanager.enable = true;
    # wireless.enable = true;
  };
  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # Select internationalisation properties.
  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_MESSAGES = "en_US.UTF-8";
      LC_ADDRESS = "ja_JP.UTF-8";
      LC_IDENTIFICATION = "ja_JP.UTF-8";
      LC_MEASUREMENT = "ja_JP.UTF-8";
      LC_MONETARY = "ja_JP.UTF-8";
      LC_NAME = "ja_JP.UTF-8";
      LC_NUMERIC = "ja_JP.UTF-8";
      LC_PAPER = "ja_JP.UTF-8";
      LC_TELEPHONE = "ja_JP.UTF-8";
      LC_TIME = "en_US.UTF-8";
    };
    inputMethod = {
      enabled = "fcitx5";
      fcitx5.addons = with pkgs; [
        fcitx5-mozc
      ];
    };
  };

  fonts = {
    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk
      noto-fonts-extra
      noto-fonts-emoji
      monaspace
      fira-code-nerdfont
    ];
  };

  # Enable RealTimeKit
  security.rtkit.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware = {
    pulseaudio.enable = false;
    bluetooth.enable = true;
  };
  services = {
    # Enable the OpenSSH daemon.
    openssh.enable = true;

    xserver = {
      enable = true;
      # Configure desktop environment
      displayManager = {
        gdm.enable = true;
      };
      desktopManager = {
        gnome.enable = true;
      };
      # Configure keymap in X11
      xkb = {
        layout = "jp";
        variant = "";
        options = "ctrl:nocaps";
      };
    };

    libinput.enable = true;
    # Enable CUPS to print documents.
    printing.enable = true;

    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      # If you want to use JACK applications, uncomment this
      #jack.enable = true;

      # use the example session manager (no others are packaged yet so this is enabled by default,
      # no need to redefine it in your config for now)
      #media-session.enable = true;
    };
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

}
