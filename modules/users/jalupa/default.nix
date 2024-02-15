{ config, pkgs, inputs, ... }:
{

  #jalupa.shell = pkgs.zsh;
  imports = [
    ./kitty.nix
    ./zsh.nix
    ./starship.nix
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

  home.username = "jalupa";
  home.homeDirectory = "/home/jalupa";
  home.stateVersion = "23.11";

  home.packages = with pkgs; [
    firefox
    signal-desktop
    keepassxc
    bitwarden
    st
    tldr
    dolphin
    feh
    grim
    slurp
    libnotify
    tor-browser-bundle-bin
    brave
    swaylock-effects #TODO improve config (hyprland.nix)

    playerctl
    # TODO implement script: https://github.com/coldfix/udiskie/wiki/Usage
    # TODO https://sr.ht/~emersion/grim/ (also in hyprmanager)
  ];
}	
