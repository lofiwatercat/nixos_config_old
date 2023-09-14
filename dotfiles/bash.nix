{ config, pkgs, ... }:

{
  programs.bash = {
    enable = true;
    shellAliases = {
      cpwd = "pwd | wl-copy";
      cdwd = "cd $(wl-paste)";
    };
  };
}