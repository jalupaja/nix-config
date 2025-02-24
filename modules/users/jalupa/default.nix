{ config, pkgs, inputs, theme, ... }:
{
  imports = [
    # DEFAULT DEPENDENCIES
    ./fonts.nix
    ./zsh.nix
    #./ssh.nix
    ./udiskie.nix
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
    #./emacs.nix
    #./emacs-overlay.nix
    #./doom-emacs
		# media viewers
    ./mpv.nix # music/video
    ./pqiv.nix # images
		./zathura.nix # (pdf) documents
		# terminal extras
    ./starship.nix
		./yazi.nix # tui file manager
		# development extras
    ./dev

    # EXTRA PROGRAMS
    # ./mpd.nix
    ./syncthing.nix
    ./btop.nix
		./nix-alien.nix # TODO currently testing
  ];

  home.username = "jalupa";
  home.homeDirectory = "/home/jalupa";
  home.stateVersion = "23.11";

  home.packages = with pkgs; [
    # DEFAULT DEPENDENCIES
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
		jmtpfs # mount phone
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
    # lemurs # TODO fix
    ripdrag
		webcamoid # camera

    # OPTIONAL DEPENDENCIES
    p7zip
    texliveFull
    jdk # java

    # EXTRA PROGRAMS WITHOUT PROGRAMS MANAGED IN HOME-MANAGER
    brave # chromium based Browser
		mullvad-browser # privacy focues, firefox based Browser
    tor-browser-bundle-bin # Tor Browser
    signal-desktop # signal client
    tutanota-desktop # tuta email client
    keepassxc # password manager
    bitwarden # password manager
    mullvad-vpn # vpn client
    onlyoffice-bin # office
    xournalpp # pdf viewer/annotator with pen drawing capabilities
    krita # painting program
    gimp # image editor
    prusa-slicer # 3D printing slicer
		freecad # 3D CAD Design
		kicad # PCB Design
		obsidian # knowledge database
		docker # container runner
		nmap # network mapping tool
		inkscape
    arduino-ide

		# TMP
		proxmark3

		ffmpeg
		python312Packages.pytaglib
		python312Packages.pybluez
		# bluez bluez-tools git gcc python312 python312Packages.pip python312Packages.setuptools python312Packages.dbus-python python312Packages.pydbus python312Packages.pybluez

		# tenacity # audacity

		# Uni (DEL later)
		openfortivpn
		flex
		bison
		figma-linux
		eclipses.eclipse-sdk
		spring-boot-cli

		btlejack
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
