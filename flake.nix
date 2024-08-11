{
  description = "total config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    nixos.url = "github:NixOS/nixpkgs/nixos-24.05";
    nixos-wsl = {
      url = "github:nix-community/NixOS-WSL";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs: 
  {
    # System-wide Configurations
    nixosConfigurations = {
      
      lenovo = inputs.nixos.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hardware/lenovo.nix
          ./global/pc.nix
          ./global/configuration.nix
        ];
        specialArgs = {
          nixos-wsl = inputs.nixos-wsl;
        };
      };

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
          ./global/dkr.nix
        ];
        specialArgs = {
          nixos-wsl = inputs.nixos-wsl;
        };
      };
    };

    # home-manager Configurations
    homeConfigurations = {

      wsl = inputs.home-manager.lib.homeManagerConfiguration {
        pkgs = import inputs.nixpkgs {
          system = "x86_64-linux";
          config.allowUnfree = true;
        };
        extraSpecialArgs = {
          inherit inputs;
        };
        modules = [
          ./home/home.nix
          ./home/wsl.nix
        ];
      };

      linux = inputs.home-manager.lib.homeManagerConfiguration {
        pkgs = import inputs.nixpkgs {
          system = "x86_64-linux";
          config.allowUnfree = true;
        };
        extraSpecialArgs = {
          inherit inputs;
        };
        modules = [
          ./home/home.nix
          ./home/linux.nix
        ];
      };

    };

  };
}
