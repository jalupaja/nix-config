{ pkgs, globals, ... }:
{
    clear-clipboard = pkgs.pkgs.writeShellScript "clear-clipboard" ''

	${pkgs.cliphist}/bin/cliphist wipe
  sleep 1
	wl-copy ""
	'';
}
