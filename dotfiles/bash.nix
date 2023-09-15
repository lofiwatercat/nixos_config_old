{ config, pkgs, ... }:

{
  programs.bash = {
    enable = true;
    shellAliases = {
      cpwd = "pwd | wl-copy";
      cdwd = "cd $(wl-paste)";
    };
    bashrcExtra = ''
      export PATH="$PATH:$HOME/bin:$HOME/.local/bin"
    '';
  };
}