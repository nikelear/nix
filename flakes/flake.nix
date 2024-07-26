{
  description = "pure";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
  };

  outputs = { self, nixpkgs }:
    let
      pkgs = import nixpkgs { system = "x86_64-linux"; };
    in {
    devShells.x86_64-linux = {
      default = pkgs.mkShell {
        packages = with pkgs; [
          python311
        ];
        shellHook = ''
          exec $SHELL -l
        '';
      };
    };
  };
}
