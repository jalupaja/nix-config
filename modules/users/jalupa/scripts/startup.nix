{ pkgs, lib, ... }:
{
startup = lib.filter (a: a!= "") (lib.splitString "\n"
''
		${pkgs.networkmanagerapplet}/bin/nm-applet --indicator
    ${pkgs.swww}/bin/swww-daemon
    $(cat ~/.wallpapercall)

    #${pkgs.syncthing}/bin/syncthing
''
);
}
