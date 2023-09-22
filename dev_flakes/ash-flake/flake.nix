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
            rustfmt
            cargo
            rust-analyzer
            vulkan-tools
            vulkan-loader
            vulkan-headers
            vulkan-caps-viewer
            vulkan-tools-lunarg
            vulkan-validation-layers
            vulkan-extension-layer
            libxkbcommon
            libGL
            wayland
            udev
            alsa-lib
            openssl
            pkg-config
          ];
          LD_LIBRARY_PATH = nixpkgs.lib.makeLibraryPath buildInputs;
          VK_LAYER_PATH = "${pkgs.vulkan-validation-layers}/share/vulkan/explicit_layer.d";
        };
      });

}