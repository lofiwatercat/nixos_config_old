{
  description = "A flake for Nix development";

  inputs.nixpkgs.url = "nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }: {
    devShell.x86_64-linux = let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in pkgs.mkShell {
      buildInputs = with pkgs; [
        nil
      ];
    };

    defaultPackage.x86_64-linux = null;
  };
}