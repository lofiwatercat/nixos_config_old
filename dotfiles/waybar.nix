{ config, pkgs, ... }:

{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 30;
        modules-left = [ "sway/workspaces" "sway/mode" ];
        modules-center = [ "sway/window" ];
        modules-right = [ "mpd" "network" "clock#date" "clock#time" ]
        "clock#time": {
          interval = 1;
          format = "{:%H:%M:%S}";
          tooltip = false;
        };
        "clock#date": {
          interval = 10;
          format = "{:%e %b %Y"};
          tooltip-format = "{:%e %B %Y}";
        };
      };
    };
  };
}