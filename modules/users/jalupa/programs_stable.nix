# Packages using the stable nixos version if the unstable version doesn't currently work
{ pkgsStable, unfreePkgsStable, ... }:
{
  home.packages = with pkgsStable; [
    # DEFAULT DEPENDENCIES

    # DESKTOP ENV PROGRAMS

    # OPTIONAL DEPENDENCIES

    # EXTRA PROGRAMS WITHOUT PROGRAMS MANAGED IN HOME-MANAGER
    unfreePkgsStable.bitwarden-desktop # password manager

    # ART

		# TMP

  ];
}

