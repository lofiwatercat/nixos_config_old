{
  description = "A flake for Ash development";

  inputs.nixpkgs.url = "nixpkgs/nixos-unstable";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
      in with pkgs; {
        devShell = mkShell rec {
          buildInputs = [
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
            wayland
            udev
            alsa-lib
            openssl
            pkg-config
          ];
          LD_LIBRARY_PATH = nixpkgs.lib.makeLibraryPath buildInputs;
        };
          # defaultPackage.x86_64-linux = null;
      });

}