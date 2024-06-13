{ pkgs, lib, ... }:
{
startup = lib.filter (a: a!= "") (lib.splitString "\n"
''
    ${pkgs.waybar}/bin/waybar
		${pkgs.networkmanagerapplet}/bin/nm-applet --indicator
    ${pkgs.swww}/bin/swww-daemon
    $(cat ~/.wallpapercall)

    #${pkgs.syncthing}/bin/syncthing
''
);
}
