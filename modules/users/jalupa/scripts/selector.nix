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
    "discord")
        app='${pkgs.firefox}/bin/firefox -p discord'
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
		"mount")
				app='${scripts.mount} -m'
				;;
		"umount")
				app='${scripts.mount} -u'
				;;
		"eject usb")
				app='${scripts.mount} -e'
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
discord
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
mount
umount
eject usb
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
# file manager

echo -e "$menu"
  '';
}
