{ pkgs, ... }:
{
  home.packages = with pkgs; [
    ffuf
    gobuster
    wpscan # UNFREE
    nikto
    burpsuite # closed source
  ];
}
