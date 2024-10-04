{ pkgs, globals, ... }:
{
	reboot = pkgs.pkgs.writeShellScript "reboot" ''

		DMENU="${globals.dmenu}"

		if [ "$(echo -e "yes\nno" | $DMENU)" = "yes" ]; then reboot; fi
			'';
}
