{
  startup = pkgs: pkgs.pkgs.writeShellScriptBin "startup" ''
    ${pkgs.waybar}/bin/waybar &
    ${pkgs.swww}/bin/swww init

    syncthing &
    wl-paste -p -t text --watch clipman store -P --histpath="~/.local/share/clipman-primary.json"

    # start wallpaper using my wallpaper script
    $(cat ~/.wallpapercall)
  '';
}
