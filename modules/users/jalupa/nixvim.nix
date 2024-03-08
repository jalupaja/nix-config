{ pkgs, lib, ... }:
let
  nixvim = import (builtins.fetchGit {
    url = "https://github.com/nix-community/nixvim";
    # If you are not running an unstable channel of nixpkgs, select the corresponding branch of nixvim.
    # ref = "nixos-23.05";
  });
in
{
 imports = [ nixvim.homeManagerModules.nixvim ];

 # For home-manager
# imports = [
#   inputs.nixvim.homeManagerModules.nixvim
#  ];
#
#  programs.nixvim = {
#    enable = true;
#  };
}
