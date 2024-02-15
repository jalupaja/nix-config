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
    ./clipman.nix
    ./dunst.nix
    #./udiskie.nix
    ./fuzzel.nix
  ];
  services.udiskie.enable = true;

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
    grim
    slurp
    libnotify
    tor-browser-bundle-bin
    brave
    swaylock-effects #TODO improve config (hyprland.nix)

    # TODO implement script: https://github.com/coldfix/udiskie/wiki/Usage
    # TODO https://sr.ht/~emersion/grim/ (also in hyprmanager)
  ];
}	
