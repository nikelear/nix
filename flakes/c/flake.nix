{
  description = "A simple C project";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {

        packages.default = pkgs.stdenv.mkDerivation {
          name = "myapp";
          src = self;
          nativeBuildInputs = [ pkgs.cmake ];
          buildPhase = ''
            cmake .
            make
          '';
          installPhase = ''
            make install
          '';
        };

        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
            gdb
            cmake
          ];
        };
      }
    );

}
