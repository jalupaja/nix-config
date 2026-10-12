# Packages using the stable nixos version if the unstable version doesn't currently work
{ pkgs-stable, ... }:
{
  home.packages = with pkgs-stable; [
    # DEFAULT DEPENDENCIES

    # DESKTOP ENV PROGRAMS

    # OPTIONAL DEPENDENCIES

    # EXTRA PROGRAMS WITHOUT PROGRAMS MANAGED IN HOME-MANAGER
    bitwarden-desktop # password manager

    # ART

		# TMP

  ];
}

