{ config, pkgs, inputs, ... }:
{
  #extraSpecialArgs = { inherit inputs; };
  imports = [
    ./vim.nix
    #./ssh.nix
    ./firefox.nix
    ./hyprland.nix
    ./waybar.nix
    ./wpaperd.nix
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
    tldr
    dolphin
    feh

    bemenu # TODO implement
    dunst # TODO implement
  ];
}	
