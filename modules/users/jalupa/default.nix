{ config, pkgs, inputs, theme, ... }:
{
  imports = [
    ./fonts.nix
    #./kitty.nix
    ./alacritty.nix
    ./foot.nix # backup terminal
    ./zsh.nix
    ./starship.nix
    ./vim.nix
    # TODO installation crashes currently
    #./nixvim.nix # neovim
    #./neovim.nix
    #./ssh.nix
    ./dev
    ./firefox.nix
    ./hyprland.nix
    ./waybar.nix
    ./clipman.nix
    ./mpv.nix
    ./dunst.nix
    #./mako.nix
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
    brave
    tor-browser-bundle-bin
    signal-desktop
    keepassxc
    bitwarden
    tldr
    p7zip
    ripdrag
    onlyoffice-bin
    zathura
    xournalpp
    ripgrep-all

    # default dependencies
    playerctl
    libnotify
    pavucontrol
    sshfs # TODO replace by home manager
    xdg-desktop-portal-hyprland # maybe replace with home manager (not hyprland)
    ripgrep
    bc
    usbutils
    # https://github.com/NixOS/nixpkgs/issues/30506

    # desktop env programs
    grim
    grimblast
    slurp
    swww
    wlr-randr
    wdisplays # gui display positioning
    swaylock-effects
    #swaynotificationcenter
    lemurs # TODO fix
  ];

  # TODO fix
#  systemd.user.services.lemurs = {
#    unitConfig = {
#      after = [ "systemd-user-sessions.service" "plymouth-quit-wait.service" "getty@tty1.service" ];
#      description = "Lemurs";
#    };
#    serviceConfig = {
#      ExecStart = "${pkgs.lemurs}/bin/lemurs";
#      StandardInput = "tty";
#      TTYPath = "/dev/tty1";
#      TTYReset = "yes";
#      TTYVHangup = "yes";
#      Type = "idle";
#    };
#    installConfig = {
#      alias = "display-manager.service";
#    };
#  };
}	
