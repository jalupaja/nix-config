{ pkgs, colors, ... }:
{
  volume = pkgs.pkgs.writeShellScript "volume" ''

    DMENU="fuzzel --dmenu"

    levels="5
    15
    50
    70
    99"

    current=$(amixer sget Master | awk -F "[][]" '/Left:/ { print $2 }')

    end () {
        #notify-send -a "volume" "set volume to $(amixer sget Master | awk -F "[][]" '/Left:/ { print $2 }') [$(amixer sget Master | awk -F "[][]" '/Left:/ { print $4 }')]"
        exit 0
    }

    end_mic () {
        #notify-send -a "volume" "set microphone to $(amixer sget Capture | awk -F "[][]" '/Left:/ { print $2 }') [$(amixer sget Capture | awk -F "[][]" '/Left:/ { print $4 }')]"
        exit 0
    }

    getopts "idtmlus:" flag
    case "''${flag}" in
        i) #increase
            amixer set Master 5%+
            end
            ;;
        d) #decrease
            amixer set Master 5%-
            end
            ;;
        t) #toggle
            amixer set Master toggle
            end
            ;;
        m) #toggle mute
            amixer set Capture toggle
            end_mic
            ;;
        l) #mic increase
            amixer set Capture 5%+
            end_mic
            ;;
        u) #mic decrease
            amixer set Capture 5%-
            end_mic
            ;;
        s) #set
            amixer set Master $OPTARG%
            end
            ;;
        :)
            value=$(echo "$levels" | $DMENU " $current ")
            amixer set Master $value%
            end
            ;;
    esac

    value=$(echo "$levels" | $DMENU " $current ")
    amixer set Master $value%
    end
  '';
}
