{ pkgs, scripts, ... }:
{
  selector = pkgs.pkgs.writeShellScript "selector" ''
    # TODO fix this
    DMENU="rofi -dmenu"
    CMD="/usr/bin/env bash -c $1"
    APPS="rofi -show drun"

    menu="\
    apps
    emacs
    firefox research
    firefox shopping
    firefox github
    tor browser
    kitty
    wallpaper
    signal
    tuta
    bitwarden
    keepassxc
    office
    xournal++
    zathura
    camera
    file manager
    wifi
    wifi gui
    bluetooth
    clipboard
    clear-clipboard
    screenshot
    brightness
    volume
    volume gui
    mount
    umount
    lock
    sleep
    shutdown
    restart
    kill
    killall
    fix
    keyboard layout
    "

    choice=$(echo -e "$menu" | ''${DMENU}) || exit

    case "$choice" in
    *\!)
        $CMD "$(printf "%s" "''${choice}" | cut -d'!' -f1)"
        ;;
    "apps")
        $APPS
        ;;
    "emacs")
        ${pkgs.emacs}/bin/emacsclient -c -a 'emacs'
        ;;
    "firefox research")
        ${pkgs.firefox}/bin/firefox -p "research"
        ;;
    "firefox shopping")
        ${pkgs.firefox}/bin/firefox -p "shopping"
        ;;
    "firefox github")
        ${pkgs.firefox}/bin/firefox -p "github"
        ;;
    "tor browser")
        ${pkgs.tor-browser-bundle-bin}/bin/tor-browser
        ;;
    "kitty")
        ${pkgs.kitty}/bin/kitty
        ;;
    "wallpaper")
        # TODO fix this
        ${scripts.wallpaper}
        ;;
    "signal")
        ${pkgs.signal-desktop}/bin/signal-desktop --enable-features=UseOzonePlatform --ozone-platform=wayland
        ;;
    "tuta")
        # TODO
        ;;
    "bitwarden")
       ${pkgs.bitwarden}/bin/bitwarden --enable-features=UseOzonePlatform --ozone-platform=wayland 
       ;;
    "keepassxc")
        ${pkgs.keepassxc}/bin/keepassxc
        ;; 
    "office")
        # TODO
        ;;
    "xournal++")
        ${pkgs.xournalpp}/bin/xournalpp
        ;;
    "zathura")
        ${pkgs.zathura}/bin/zathura
        ;;
    "camera")
        # TODO
        ;;
    "file manager")
        # TODO
        ;;
    "wifi")
        # TODO scripts
        ;;
    "wifi gui")
        # TODO
        ;;
    "bluetooth")
        # TODO
        ;;
    "clipboard")
        # TODO
        ${pkgs.clipman}/bin/clipman pick -t STDOUT | $DMENU
        ;;
    "clear-clipboard")
        ${pkgs.clipman}/bin/clipman clear --all
        ;;
    "screenshot")
        # TODO script
        ;;
    "brightness")
        # TODO script
        ;;
    "volume")
        # TODO sciprt
        ;;
    "volume gui")
        # TODO
        ;;
    "mount")
        # TODO script
        ;;
    "umount")
        # TODO script
        ;;
    "lock")
        ${scripts.lock}
        ;;
    "sleep")
        systemctl suspend
        ${scripts.lock}
        # TODO lock script (without timer)
        ;;
    "shutdown")
        if [ "$(echo -e "yes\nno" | $DMENU)" = "yes" ]; then systemctl shutdown; fi
        ;;
    "restart")
        if [ "$(echo -e "yes\nno" | $DMENU)" = "yes" ]; then systemctl reboot; fi
        ;;
    "kill")
        ${scripts.kill}
        ;;
    "killall")
        ${scripts.killall}
        ;;
    "fix")
        # TODO script
        ;;
    "keyboard layout")
        # TODO
        ;;
    *)
        echo "ERROR: choice not in list"
        exit
        ;;
    esac

  '';
}
