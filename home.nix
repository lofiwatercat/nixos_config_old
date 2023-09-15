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

  nix.registry = {
    rust = {
      from = {
        id = "rust";
        type = "indirect";
      };
      to = {
        type = "path";
        # path = "./dev_flakes/rust-flake";
        path = toString ./. + "/dev_flakes/rust-flake";
        # owner = "lofiwatercat";
        # repo = "nixos_config";
      };
    };
  };

   
  programs.home-manager.enable = true;
}