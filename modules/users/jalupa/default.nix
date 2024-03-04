{ config, pkgs, inputs, theme, ... }:
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
    ./clipman.nix
    ./mpv.nix
    ./dunst.nix
    #./mako.nix
    ./udiskie.nix
    ./fuzzel.nix
    ./pqiv.nix
    ./mpd.nix
    ./syncthing.nix
    ./emacs.nix
    #./emacs-overlay.nix
    #./doom-emacs
    ./gtk.nix
    ./rofi.nix
    ./mime.nix
    ./btop.nix
  ];
  # TODO https://sw.kovidgoyal.net/kitty/overview/

  # TODO works. use this for emacs
  # home.file."test".text = builtins.readFile ./dunst.nix;

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
    p7zip
    ripdrag
    onlyoffice-bin
    zathura
    xournalpp

    # default dependencies
    playerctl
    libnotify
    pavucontrol
    sshfs # TODO replace by home manager
    xdg-desktop-portal-hyprland # maybe replace with home manager (not hyprland)
    udiskie
    bc

    # desktop env programs
    grim
    grimblast
    slurp
    swww
    wlr-randr
    swaylock-effects
    #swaynotificationcenter
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
