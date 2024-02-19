{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nur.url = "github:nix-community/NUR";

    hyprland.url = "github:hyprwm/Hyprland";
    nix-doom-emacs.url = "github:nix-community/nix-doom-emacs";
    split-monitor-workspaces = {
      url = "github:Duckonaut/split-monitor-workspaces";
      inputs.hyprland.follows = "hyprland";
    };
    hyprgrass = {
      url = "github:horriblename/hyprgrass";
      inputs.hyprland.follows = "hyprland";
    };
  };

  outputs = { self, nixpkgs, home-manager, split-monitor-workspaces, hyprgrass, nur, nix-doom-emacs, ...}@inputs: 
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
