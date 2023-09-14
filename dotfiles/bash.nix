{ config, pkgs, ... }:

{
  programs.bash = {
    enable = true;
    interactiveShellInit = ''
      alias cpwd="pwd | wl-copy"
      alias cdwd="cd $(wl-paste)";
      PS1='\w \$ '
    '';
  };
}