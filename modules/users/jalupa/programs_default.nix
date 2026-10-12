# DEFAULT DEPENDENCIES
{ pkgs, ... }:
{
  home.packages = with pkgs; [
    playerctl
    libnotify
    pavucontrol
    sshfs # TODO replace by home manager
    wl-clipboard
    ripgrep
    fd
    bc
    usbutils
    tldr
    ripgrep-all
		file
		# simple-mtpfs # mount phone
    # https://github.com/NixOS/nixpkgs/issues/30506
  ];
  imports = [
    ./programs/fonts.nix
    ./programs/zsh.nix
    ./programs/bash.nix
    #./programs/ssh.nix
    ./programs/udiskie.nix
    ./programs/gtk.nix # (hopefully) just dark mode
    ./programs/mime.nix # setup default programs
  ];
}
