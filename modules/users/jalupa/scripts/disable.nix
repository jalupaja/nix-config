{ pkgs, globals, ... }:
{
	disable = pkgs.pkgs.writeShellScript "disable" ''
    # TODO improve (Langzeitprovisorium)

		DMENU="${globals.dmenu}"

    options="touch on\ntouch off\nmousepad on\nmousepad off"

    # find device names using hyprctl devices
    case $(echo -e $options | $DMENU "Select device") in
      "touch on")
          hyprctl keyword "device[wacom-hid-523a-finger]:enabled" true
        ;;
      "touch off")
          hyprctl keyword "device[wacom-hid-523a-finger]:enabled" false
        ;;
    esac
			'';
}
