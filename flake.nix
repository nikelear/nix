{
  description = "total config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nixos.url = "github:NixOS/nixpkgs/nixos-23.11";
    nixos-wsl = {
      url = "github:nix-community/NixOS-WSL";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs: {

    nixosConfigurations = {
      wsl = inputs.nixos.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./global/configuration.nix
          ./global/wsl.nix
        ];
        specialArgs = {
          nixos-wsl = inputs.nixos-wsl;
        };
      };

      wsldkr = inputs.nixos.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./global/configuration.nix
          ./global/wsl.nix
          ./global/dkr_proxy.nix
        ];
        specialArgs = {
          nixos-wsl = inputs.nixos-wsl;
        };
      };
    };

    homeConfigurations = {
      home = inputs.home-manager.lib.homeManagerConfiguration {
        pkgs = import inputs.nixpkgs {
          system = "x86_64-linux";
          config.allowUnfree = true;
        };
        extraSpecialArgs = {
          inherit inputs;
        };
        modules = [
          ./home/home.nix
        ];
      };

      none = inputs.home-manager.lib.homeManagerConfiguration {
        pkgs = import inputs.nixpkgs {
          system = "x86_64-linux";
          config.allowUnfree = true;
        };
        extraSpecialArgs = {
          inherit inputs;
        };
        modules = [
          ./home/none.nix
        ];
      };

      none = inputs.home-manager.lib.homeManagerConfiguration {
        pkgs = import inputs.nixpkgs {
          system = "x86_64-linux";
          config.allowUnfree = true;
        };
        extraSpecialArgs = {
          inherit inputs;
        };
        modules = [
          ./home_none.nix
        ];
      };

    };

  };
}
