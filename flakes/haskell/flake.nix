{
  description = "A Haskell project";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        haskellPackages = pkgs.haskellPackages;

        packageName = "your-project-name";

        package = haskellPackages.callCabal2nix packageName self {};

      in
      {
        packages.${packageName} = package;
        defaultPackage = self.packages.${system}.${packageName};

        devShell = pkgs.mkShell {
          buildInputs = with haskellPackages; [
            cabal-install
            ghc
            haskell-language-server
          ];
          inputsFrom = [ package.env ];
        };
      });
}
