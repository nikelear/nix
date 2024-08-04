{
  description = "A simple C project";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {

      packages.${system}.default = pkgs.stdenv.mkDerivation {
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

      devShells.${system}.default = pkgs.mkShell {
        buildInputs = with pkgs; [
          gdb
          cmake
        ];
      };

    };

}
