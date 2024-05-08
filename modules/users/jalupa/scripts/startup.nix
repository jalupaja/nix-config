{ pkgs, ... }:
{
  startup = pkgs.pkgs.writeShellScript "startup" ''
    ${pkgs.waybar}/bin/waybar &
    ${pkgs.swww}/bin/swww-daemon
    $(cat ~/.wallpapercall)

    #${pkgs.syncthing}/bin/syncthing &

    # start wallpaper using my wallpaper script
  '';
}
