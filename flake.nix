{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nur.url = "github:nix-community/NUR";

    hyprland = {
			type = "git";
			url = "https://github.com/hyprwm/Hyprland";
			submodules = true;

		};

		lemurs = {
			# url = "github:coastalwhite/lemurs";
			url = "github:NullCub3/lemurs/nixosmodule-old";
			inputs.nixpkgs.follows = "nixpkgs";
		};

   #  split-monitor-workspaces = {
   #    url = "github:Duckonaut/split-monitor-workspaces";
   #    inputs.hyprland.follows = "hyprland";
   #  };
    hyprsplit = {
			url = "github:shezdy/hyprsplit";
			inputs.hyprland.follows = "hyprland";
    };
    # hyprgrass = {
    #   url = "github:horriblename/hyprgrass";
    #   inputs.hyprland.follows = "hyprland";
    # };
		hypr-dynamic-cursors = {
			url = "github:VirtCode/hypr-dynamic-cursors";
			inputs.hyprland.follows = "hyprland"; # to make sure that the plugin is built for the correct version of hyprland
		};

    nixvim = {
     url = "github:nix-community/nixvim";
     # inputs.nixpkgs.follows = "nixpkgs";
    };

		nix-alien = {
			url = "github:thiagokokada/nix-alien";
      # inputs.nixpkgs.follows = "nixpkgs";
		};

  };

  outputs = {
      self,
      nixpkgs,
      home-manager,
      # split-monitor-workspaces,
			hyprsplit,
      # hyprgrass,
      nur,
      nixvim,
			nix-alien,
			lemurs,
      ...
    } @ inputs:
  let
    pkgs = import nixpkgs {
      system = "x86_64-linux";
      overlays = [
        nur.overlay
      ];
    };
  in
  {
    extraSpecialArgs = { inherit inputs; };
    nixosConfigurations."debian" = nixpkgs.lib.nixosSystem {
      modules = [
        home-manager.nixosModules.home-manager ( import ./modules/home-manager.nix )
        ./modules/all
        ./hardware/touch-notebook.nix
        nur.nixosModules.nur
        lemurs.nixosModules.default
      ];
      specialArgs = {
        nur = pkgs.nur;
        inherit inputs;
      };
    };

    packages.x86_64-linux.hello = nixpkgs.legacyPackages.x86_64-linux.hello;

    packages.x86_64-linux.default = self.packages.x86_64-linux.hello;

  };
}
