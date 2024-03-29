{ config, pkgs, inputs, theme, ... }:
{
  imports = [
    # DEFAULT DEPENDENCIES
    ./fonts.nix
    ./zsh.nix
    #./ssh.nix
    #./udiskie.nix
    ./gtk.nix # (hopefully) just dark mode
    ./mime.nix # setup default programs

    # DESKTOP ENV PROGRAMS
		# Desktop environment
    ./hyprland.nix
    ./waybar.nix
		# clipboard manager
    ./cliphist.nix
    #./clipman.nix
		# notification manager
    ./dunst.nix
    #./mako.nix
		# dmenu replacements
    ./rofi.nix
    #./fuzzel.nix

    # OPTIONAL DEPENDENCIES
		# browser
    ./firefox.nix
		# terminal emulators
    ./alacritty.nix
    #./kitty.nix
    ./foot.nix # backup terminal
		# editors
    ./vim.nix
    ./nixvim.nix # neovim
    #./neovim.nix
    ./emacs.nix
    #./emacs-overlay.nix
    #./doom-emacs
		# media viewers
    ./mpv.nix # music/video
    ./pqiv.nix # images
		./zathura.nix # (pdf) documents
		# terminal extras
    ./starship.nix
		# development extras
    ./dev

    # EXTRA PROGRAMS
    ./mpd.nix
    ./syncthing.nix
    ./btop.nix
  ];
  # TODO possible configs
  # lazygit

  home.username = "jalupa";
  home.homeDirectory = "/home/jalupa";
  home.stateVersion = "23.11";

  home.packages = with pkgs; [
    # DEFAULT DEPENDENCIES
    playerctl
    libnotify
    pavucontrol
    sshfs # TODO replace by home manager
    xdg-desktop-portal-hyprland # maybe replace with home manager (not hyprland)
    wl-clipboard
    ripgrep
    fd
    bc
    usbutils
    tldr
    ripgrep-all
    # https://github.com/NixOS/nixpkgs/issues/30506

    # DESKTOP ENV PROGRAMS
    grim
    grimblast
    slurp
    swww
    wlr-randr
    wdisplays # gui display positioning
    swaylock-effects
    #swaynotificationcenter
    lemurs # TODO fix
    ripdrag

    # OPTIONAL DEPENDENCIES
    p7zip
    texliveFull
    jdk # java

    # EXTRA PROGRAMS WITHOUT PROGRAMS MANAGED IN HOME-MANAGER
    brave # chromium based Browser
    tor-browser-bundle-bin # Tor Browser
    signal-desktop # signal client
    tutanota-desktop # tuta email client
    keepassxc # password manager
    bitwarden # password manager
    onlyoffice-bin # office
    xournalpp # pdf viewer/annotator with pen drawing capabilities
    krita # painting program
    prusa-slicer # 3D printing slicer

    # UNI STUFF
    asymptote # programmable vector graphics
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
