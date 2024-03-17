{ pkgs, globals, ... }:
{
    rem-from-clipboard = pkgs.pkgs.writeShellScript "rem-from-clipboard" ''

	DMENU="${globals.dmenu}"
	cliphist list | ${globals.dmenu} | cliphist delete 
	'';
}
