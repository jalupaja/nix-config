{ config, pkgs, inputs, colors, ... }:
{
  imports = [
    ./kitty.nix
    #./alacritty.nix
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
    ./emacs.nix
    #./emacs-overlay.nix
    #./doom-emacs
    ./gtk.nix
    ./rofi.nix
  ];
  # TODO https://sw.kovidgoyal.net/kitty/overview/

  # TODO possible configs
  # lazygit
  # mimeApps https://github.com/coffee-is-power/nix-configuration/blob/flakes/modules/home/mime-apps/default.nix

  home.username = "jalupa";
  home.homeDirectory = "/home/jalupa";
  home.stateVersion = "23.11";

  home.packages = with pkgs; [
    # default programs
    firefox
    brave
    tor-browser-bundle-bin
    signal-desktop
    keepassxc
    bitwarden
    foot
    tldr
    mpv
    ripdrag
    #onlyoffice
    zathura
    xournalpp

    # default dependencies
    playerctl
    libnotify
    sshfs # TODO replace by home manager

    # desktop env programs
    grim
    slurp
    swww
    swaylock-effects
    lemurs # TODO fix
    # TODO implement script: https://github.com/coldfix/udiskie/wiki/Usage
    # TODO https://sr.ht/~emersion/grim/ (also in hyprmanager)
  ];

  # TODO fix
  systemd.user.services.lemurs = {
    unitConfig = {
      after = [ "systemd-user-sessions.service" "plymouth-quit-wait.service" "getty@tty1.service" ];
      description = "Lemurs";
    };
    serviceConfig = {
      ExecStart = "${pkgs.lemurs}/bin/lemurs";
      StandardInput = "tty";
      TTYPath = "/dev/tty1";
      TTYReset = "yes";
      TTYVHangup = "yes";
      Type = "idle";
    };
    installConfig = {
      alias = "display-manager.service";
    };
  };
}	
