{ config, pkgs, ... }:

{
  imports =
    [ 
      ./dotfiles/bash.nix
      ./dotfiles/git.nix
      ./dotfiles/foot.nix
      ./dotfiles/helix.nix
      ./dotfiles/sway.nix
      ./dotfiles/waybar.nix
    ];

  home = {
    username = "alan";
    homeDirectory = "/home/alan";
    stateVersion = "23.05";
    sessionVariables = {
      EDITOR = "hx";
      TERMINAL = "foot";
    };

    packages = with pkgs; [
      fuzzel
      # cargo
      # rustc
      # rust-analyzer
      swww
    ];
  };

  # home.file.".config/nix/registry.json".text = builtins.toJSON {
  # version = 1;
  # registries = {
  #     rust = {
  #       flake = "./dev_flakes/rust-flake";
  #     };
  #     rust-git = {
  #       flake = "github:lofiwatercat/nixos_config/dev_flakes/rust-flake";
  #     };
  #   };
  # };

   
  programs.home-manager.enable = true;
}