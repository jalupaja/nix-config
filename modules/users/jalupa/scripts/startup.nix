{ pkgs, ... }:
{
  startup = pkgs.pkgs.writeShellScript "startup" ''
    ${pkgs.waybar}/bin/waybar &
    ${pkgs.swww}/bin/swww init

    ${pkgs.syncthing}/bin/syncthing &

    # start wallpaper using my wallpaper script
    $(cat ~/.wallpapercall)
  '';
}
