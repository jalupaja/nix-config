{ pkgs, globals, ... }:
{
    clipboard = pkgs.pkgs.writeShellScript "clipboard" ''

	DMENU="${globals.dmenu}"

	sel=$(cliphist list | $DMENU)

	echo "$sel" | cliphist decode | wl-copy
	echo "$sel" | cliphist decode
	'';
}
