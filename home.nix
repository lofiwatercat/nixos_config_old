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
      ./dotfiles/starship.nix
    ];

  home = {
    username = "alan";
    homeDirectory = "/home/alan";
    stateVersion = "23.05";
    sessionVariables = {
      EDITOR = "hx";
      TERMINAL = "foot";
      WINIT_UNIX_BACKEND = "wayland";
    };

    packages = with pkgs; [
      fuzzel
      swww
      wayland
      airshipper
      mpd
      steam
      marksman
      winePackages.wayland
    ];
  };

  home.file.".config/wallpapers" = {
    source = ./dotfiles/wallpapers;
    recursive = true;
  };

  nix.registry = {
    rust = {
      from = {
        id = "rust";
        type = "indirect";
      };
      to = {
        type = "path";
        path = toString ./. + "/dev_flakes/rust-flake";
      };
    };
    ash = {
      from = {
        id = "ash";
        type = "indirect";
      };
      to = {
        type = "path";
        path = toString ./. + "/dev_flakes/ash-flake";
      };
    };
    nix = {
      from = {
        id = "nix";
        type = "indirect";
      };
      to = {
        type = "path";
        path = toString ./. + "/dev_flakes/nix-flake";
      };
    };
  };

   
  programs.home-manager.enable = true;
}