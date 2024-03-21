{ pkgs, globals, ... }:
{
    clear-clipboard = pkgs.pkgs.writeShellScript "clear-clipboard" ''

	${pkgs.cliphist}/bin/cliphist wipe
	wl-copy ""
	'';
}
