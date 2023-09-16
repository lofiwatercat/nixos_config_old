{
  description = "A flake for Ash development";

  inputs.nixpkgs.url = "nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }: {
    devShell.x86_64-linux = let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in pkgs.mkShell {
      buildInputs = with pkgs; [
        rustc
        cargo
        rust-analyzer
        vulkan-tools
        vulkan-loader
        vulkan-headers
        vulkan-caps-viewer
        vulkan-tools-lunarg
        vulkan-validation-layers
        libxkbcommon
        libGL
        udev
        udev
        alsa-lib
        openssl
        pkg-config
      ];

      # LD_LIBRARY_PATH = nixpkgs.lib.makeLibraryPath buildInputs;
    };

    defaultPackage.x86_64-linux = null;
  };
}