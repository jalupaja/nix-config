# ART
{ pkgs, ... }:
{
  home.packages = with pkgs; [
    gimp # image editor
    # darktable # edit raw image files
    rawtherapee # edit raw image files
		inkscape # svg editor
    krita # painting program
    geeqie # image viewer
    # hugin # stitch panorama photos
  ];
}

