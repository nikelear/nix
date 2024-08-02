{
  description = "A poetry2nix project";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    flake-utils.url = "github:numtide/flake-utils";
    poetry2nix = {
      url = "github:nix-community/poetry2nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, flake-utils, poetry2nix }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        inherit (poetry2nix.lib.mkPoetry2Nix { inherit pkgs; }) mkPoetryApplication;
        pythonpkg = pkgs.python312;
      in
      {
        packages = {
          myapp = mkPoetryApplication { 
            projectDir = self;
            python = pythonpkg;
          };
          default = self.packages.${system}.myapp;
        };

        devShells.default = pkgs.mkShell {
          inputsFrom = [ self.packages.${system}.myapp ];
          packages = [ pkgs.poetry pythonpkg ];
          shellHook = ''
            python --version
          '';
          FPATH = "${
            pkgs.buildEnv {
              name = "zsh-comp";
              paths = packages;
              pathsToLink = "/share/zsh";
            }
          }/share/zsh/site-functions";
        };
      });
}
