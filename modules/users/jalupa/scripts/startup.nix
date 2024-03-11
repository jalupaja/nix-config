{ pkgs, ... }:
{
  startup = pkgs.pkgs.writeShellScript "startup" ''
    ${pkgs.waybar}/bin/waybar &
    ${pkgs.swww}/bin/swww init

    ${pkgs.syncthing}/bin/syncthing &
    wl-paste -n -p -t text --watch clipman store -P --histpath="~/.local/share/clipman-primary.json"

    # start wallpaper using my wallpaper script
    $(cat ~/.wallpapercall)
  '';
}
