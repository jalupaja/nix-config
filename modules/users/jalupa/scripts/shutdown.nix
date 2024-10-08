{ pkgs, globals, ... }:
{
	shutdown = pkgs.pkgs.writeShellScript "shutdown" ''

		DMENU="${globals.dmenu}"

		if [ "$(echo -e "yes\nno" | $DMENU)" = "yes" ]; then shutdown now; fi
			'';
}
