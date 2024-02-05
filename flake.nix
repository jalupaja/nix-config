{
	description = "A very basic flake";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		nur.url = "github:nix-community/NUR";
	};

	outputs = { self, nixpkgs, home-manager, nur}: 
		let
		pkgs = import nixpkgs {
			system = "x86_64-linux";
			overlays = [ 
				nur.overlay
			];
		};
	in
	{

		nixosConfigurations."debian" = nixpkgs.lib.nixosSystem {
			system = "x80_64-linux";
			modules = [ 
				home-manager.nixosModules.home-manager ( import ./modules/home-manager.nix )
				./modules/all
				./hardware/touch-notebook.nix
				nur.nixosModules.nur
			];
			specialArgs = {
				nur = pkgs.nur;
			};
		};

		packages.x86_64-linux.hello = nixpkgs.legacyPackages.x86_64-linux.hello;

		packages.x86_64-linux.default = self.packages.x86_64-linux.hello;

	};
}
