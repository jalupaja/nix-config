{ config, pkgs, inputs, colors, ... }:
{
  imports = [
    ./kitty.nix
    ./zsh.nix
    ./starship.nix
    ./vim.nix
    #./ssh.nix
    ./firefox.nix
    ./hyprland.nix
    ./waybar.nix
    #./wpaperd.nix
    ./clipman.nix
    ./dunst.nix
    #./udiskie.nix
    ./fuzzel.nix
    ./pqiv.nix
    ./mpd.nix
    ./syncthing.nix
    #./emacs.nix
    #./doom-emacs
    ./gtk.nix
    ./rofi.nix
  ];
  # TODO https://sw.kovidgoyal.net/kitty/overview/

  # TODO possible configs
  # hyprpaper https://github.com/coffee-is-power/nix-configuration/blob/flakes/modules/home/hyprpaper/default.nix
  # lazygit
  # mimeApps https://github.com/coffee-is-power/nix-configuration/blob/flakes/modules/home/mime-apps/default.nix

  home.username = "jalupa";
  home.homeDirectory = "/home/jalupa";
  home.stateVersion = "23.11";

  home.packages = with pkgs; [
    firefox
    signal-desktop
    keepassxc
    bitwarden
    foot
    tldr
    grim
    slurp
    libnotify
    tor-browser-bundle-bin
    brave
    swaylock-effects
    mpv

    swww
    lemurs
    playerctl
    # TODO implement script: https://github.com/coldfix/udiskie/wiki/Usage
    # TODO https://sr.ht/~emersion/grim/ (also in hyprmanager)
  ];

  # TODO
#  systemd.user.services.lemurs = {
#
#
#    unitConfig = {
#      after = [ "systemd-user-sessions.service" "plymouth-quit-wait.service" "getty@tty2.service" ];
#      description = "Lemurs";
#    };
#    serviceConfig = {
#      ExecStart = "${pkgs.lemurs}/bin/lemurs";
#      StandardInput = "tty";
#      TTYPath = "/dev/tty2";
#      TTYReset = "yes";
#      TTYVHangup = "yes";
#      Type = "idle";
#    };
#    installConfig = {
#      alias = "display-manager.service";
#    };
#  };
}	
