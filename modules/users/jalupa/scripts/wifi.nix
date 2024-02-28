{ pkgs, globals, ... }:
{
  wifi = pkgs.pkgs.writeShellScript "wifi" ''
    DMENU="${globals.dmenu}"

    # This script is copied from https://github.com/GeorgiChalakov01/wifi-control
    # and has been edited to work for me

    case $(echo -e "CONNECT\nDISCONNECT\nWIFI ON\nWIFI OFF" | $DMENU "WIFI Options: " -l 4;) in
        CONNECT)
            wifiname=$(nmcli d wifi list | $DMENU "Select WIFI" -l 20 | cut -d' ' -f9);
            if [ -n "$wifiname" ]; then
                nmcli d wifi connect $wifiname
            fi

            sleep 5
            wget -q --spider https://duckduckgo.com
            if [ $? -eq 0 ]; then
                notify-send -a wifi "wifi activated!"
            else
                notify-send -a wifi "connection failed!"
            fi
            ;;
        DISCONNECT)
            internet=$(nmcli | grep "connected" | sed -n '1p' | cut -c 22-);
            nmcli con down id $internet;
            ;;
        "WIFI ON")
            nmcli radio wifi on;
            ;;
        "WIFI OFF")
            nmcli radio wifi off;
            ;;
        *)
            echo "idk what happend. terminating..." && exit 0
            ;;
    esac
  '';
}
