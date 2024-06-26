{ pkgs, scripts, globals, ... }:
{
  selector = pkgs.pkgs.writeShellScript "selector" ''
    DMENU="${globals.dmenu}"
    CMD="/usr/bin/env bash -c $1"
    APPS="${globals.app_runner}"

    menu="\
    apps
    emacs
    firefox research
    firefox uni
    firefox shopping
    firefox github
    tor browser
    alacritty
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
    remove from clipboard
    clear-clipboard
    screenshot
    brightness
    volume
    volume gui
    monitor setup
    monitor setup gui
    mount
    umount
    lock
    sleep
    shutdown
    restart/reboot
    kill
    killall
    fix
    keyboard layout\
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
    "firefox uni")
        ${pkgs.firefox}/bin/firefox -p "uni"
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
    "alacritty")
        ${pkgs.alacritty}/bin/alacritty
        ;;
    "kitty")
        ${pkgs.kitty}/bin/kitty
        ;;
    "wallpaper")
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
        ${pkgs.libreoffice}/bin/libreoffice
        ;;
    "xournal++")
        ${pkgs.xournalpp}/bin/xournalpp
        ;;
    "zathura")
        ${pkgs.zathura}/bin/zathura
        ;;
    "camera")
        ${pkgs.webcamoid}/bin/webcamoid
        ;;
    "file manager")
        # TODO
        ;;
    "wifi")
        ${scripts.wifi}
        ;;
    "wifi gui")
        # TODO
        ;;
    "bluetooth")
        ${scripts.bluetooth}
        ;;
    "clipboard")
        ${scripts.clipboard}
        ;;
    "remove from clipboard")
        ${scripts.rem-from-clipboard}
        ;;
    "clear-clipboard")
        ${scripts.clear-clipboard}
        ;;
    "screenshot")
        ${scripts.screenshot}
        ;;
    "brightness")
        ${scripts.brightness}
        ;;
    "volume")
        ${scripts.volume}
        ;;
    "volume gui")
        ${pkgs.pavucontrol}/bin/pavucontrol
        ;;
    "monitor setup")
        ${scripts.monitorsetup}
        ;;
    "monitor setup gui")
        ${pkgs.wdisplays}/bin/wdisplays
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
        ;;
    "shutdown")
        if [ "$(echo -e "yes\nno" | $DMENU)" = "yes" ]; then poweroff; fi
        ;;
    "restart/reboot")
        if [ "$(echo -e "yes\nno" | $DMENU)" = "yes" ]; then reboot; fi
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
        ${scripts.keyboard_layout}
        ;;
    *)
        echo "ERROR: choice not in list"
        exit
        ;;
    esac

  '';
}
