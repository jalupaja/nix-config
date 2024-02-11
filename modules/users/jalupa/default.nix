{ config, pkgs, ... }:
{
  imports = [
    ./vim.nix
    #./ssh.nix
    ./firefox.nix
    ./hyprland.nix
    #./waybar.nix
  ];

  home.username = "jalupa";
  home.homeDirectory = "/home/jalupa";
  home.stateVersion = "23.11";

  home.packages = with pkgs; [
    firefox
    signal-desktop
    keepassxc
    bitwarden
    kitty
    bemenu
  ];
}	
