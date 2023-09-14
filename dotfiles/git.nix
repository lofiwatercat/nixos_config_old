{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "lofiwatercat";
    userEmail = "alan001tk@gmail.com";
  };

  xdg.configFile."git/config".text = ''
    [init]
    defaultBranch = "main";
  '';
}
