# DESKTOP ENV PROGRAMS
{ pkgs, ... }:
{
  home.packages = with pkgs; [
    grim
    grimblast
    slurp
    awww
    wlr-randr
    wdisplays # gui display positioning
    swaylock-effects
    #swaynotificationcenter
    # lemurs # TODO fix
    ripdrag
    webcamoid # camera
  ];
  imports = [
		# Desktop environment
    ./programs/hyprland.nix
    # ./programs/xdg-portal.nix # enable screen share
    ./programs/waybar.nix
		# clipboard manager
    ./programs/cliphist.nix
    #./programs/clipman.nix
		# notification manager
    ./programs/dunst.nix
    #./programs/mako.nix
		# dmenu replacements
    ./programs/rofi.nix
    #./programs/fuzzel.nix
  ];
}
