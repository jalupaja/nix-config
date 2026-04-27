{ pkgs, ... }:
{
  home.packages = with pkgs; [
    ffuf
    gobuster
    wpscan
    nikto
    burpsuite # closed source
  ];
}
