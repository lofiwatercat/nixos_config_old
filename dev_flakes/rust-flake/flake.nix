{
  description = "A flake for Rust development";

  inputs.nixpkgs.url = "nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }: {
    devShell.x86_64-linux = let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in pkgs.mkShell {
      buildInputs = with pkgs; [
        rustc
        cargo
        rustfmt
        rust-analyzer
        openssl
        pkg-config
      ];
    };

    defaultPackage.x86_64-linux = null;
  };
}