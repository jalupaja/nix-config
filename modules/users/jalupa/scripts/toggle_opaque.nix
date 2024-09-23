{ pkgs, ... }:
{
    toggle_opaque = pkgs.pkgs.writeShellScript "toggle_opaque" ''
			hyprctl setprop active opaque toggle
	'';
}
