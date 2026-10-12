{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # TMP
		ffmpeg

		# Uni TMP
		openfortivpn
    # zotero
    threema-desktop
    codex
  ];

  imports = [
  ];
}

