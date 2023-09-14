{ config, pkgs, ... }:

{
  imports =
    [ 
      ./dotfiles/bash.nix
      ./dotfiles/git.nix
      ./dotfiles/foot.nix
      ./dotfiles/helix.nix
      ./dotfiles/sway.nix
    ];

  home = {
    username = "alan";
    homeDirectory = "/home/alan";
    stateVersion = "23.05";
    sessionVariables = {
      EDITOR = "hx";
    };

    sessionVariables = {
      EDITOR = "hx";
    };

    packages = with pkgs; [
      fuzzel
      cargo
      rustc
      rust-analyzer
      swww
    ];
  };
    
  programs.home-manager.enable = true;
}