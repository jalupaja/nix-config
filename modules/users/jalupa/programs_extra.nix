# EXTRA PROGRAMS
{ pkgs, unfreePkgs, ... }:
{
  home.packages = with pkgs; [
    brave # chromium based Browser
		mullvad-browser # privacy focues, firefox based Browser
    tor-browser # Tor Browser
    signal-desktop # signal client
    tutanota-desktop # tuta email client
    keepassxc # password manager
    # bitwarden-desktop # password manager
    mullvad-vpn # vpn client
    libreoffice # office
    xournalpp # pdf viewer/annotator with pen drawing capabilities
    prusa-slicer # 3D printing slicer
    element-desktop # matrix client
		freecad # 3D CAD Design
		unfreePkgs.obsidian # knowledge database
		docker # container runner
		nmap # network mapping tool
    # arduino-ide # TODO -> dev
		# kicad # PCB Design # TODO -> dev
    mmex
    thunderbird
    # TODO beeref # image reference viewer
    openvpn
  ];

  imports = [
    # ./programs/mpd.nix
    ./programs/syncthing.nix
    ./programs/btop.nix
    ./programs/kvm.nix
		# ./programs/nix-alien.nix # TODO currently testing
  ];
}
