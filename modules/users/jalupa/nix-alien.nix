{ inputs, system, ... }:
{
	home.packages = with inputs.nix-alien.packages."x86_64-linux"; [
		nix-alien
	];
}
