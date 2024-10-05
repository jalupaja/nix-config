{ pkgs, scripts, globals, ... }:
{
  selector = pkgs.pkgs.writeShellScript "selector" ''

app=' '
if [ ! -z "$@" ]; then
    case "$@" in
    "emacs")
        app='${pkgs.emacs}/bin/emacsclient -c -a emacs'
        ;;
    "firefox research")
        app='${pkgs.firefox}/bin/firefox -p research'
        ;;
    "firefox uni")
        app='${pkgs.firefox}/bin/firefox -p uni'
        ;;
    "firefox shopping")
        app='${pkgs.firefox}/bin/firefox -p shopping'
        ;;
    "firefox github")
        app='${pkgs.firefox}/bin/firefox -p github'
        ;;
    "wallpaper")
        app='${scripts.wallpaper}'
        ;;
    "file manager")
        # TODO
        ;;
    "wifi")
        app='${scripts.wifi}'
        ;;
    "bluetooth")
        app='${scripts.bluetooth}'
        ;;
    "clipboard")
        app='${scripts.clipboard}'
        ;;
    "remove from clipboard")
        app='${scripts.rem-from-clipboard}'
        ;;
    "clear-clipboard")
        app='${scripts.clear-clipboard}'
        ;;
    "screenshot")
        app='${scripts.screenshot}'
        ;;
    "brightness")
        app='${scripts.brightness}'
        ;;
    "volume")
        app='${scripts.volume}'
        ;;
    "volume gui")
        app='${pkgs.pavucontrol}/bin/pavucontrol'
        ;;
    "monitor setup")
        app='${scripts.monitorsetup}'
        ;;
    "monitor setup gui")
        app='${pkgs.wdisplays}/bin/wdisplays'
        ;;
    "lock")
        app='${scripts.lock}'
        ;;
    "sleep")
        systemctl suspend
        app='${scripts.lock}'
        ;;
    "shutdown")
        app='${scripts.shutdown}'
        ;;
    "restart/reboot")
        app='${scripts.reboot}'
        ;;
    "kill")
        app='${scripts.kill}'
        ;;
    "killall")
        app='${scripts.killall}'
        ;;
    "fix")
        # TODO script
        ;;
    "keyboard layout")
        app='${scripts.keyboard_layout}'
        ;;
    esac

    read -ra app <<< "$app"
    coproc ( ''${app[@]} ) #> /dev/null  2>&1 )

    exit
fi

menu="\
emacs
firefox research
firefox uni
firefox shopping
firefox github
wallpaper
wifi
wifi gui
bluetooth
clipboard
remove from clipboard
clear-clipboard
screenshot
brightness
volume
volume gui
monitor setup
monitor setup gui
lock
sleep
shutdown
restart/reboot
kill
killall
fix
keyboard layout\
	"
# TODO
# mount
# file manager
# umount

echo -e "$menu"
  '';
}
