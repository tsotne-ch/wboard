{
  description = "Node.js, npm, and Go Development Environment";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      devShells.${system}.default = pkgs.mkShell {
        buildInputs = [
          pkgs.nodejs
          pkgs.go
        ];

        shellHook = ''
          export GOPATH="$PWD/.go"
          export PATH="$GOPATH/bin:$PATH"
          echo "Node.js $(node -v), npm $(npm -v), and Go $(go version) loaded!"
        '';
      };
    };
}