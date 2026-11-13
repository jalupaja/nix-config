{ pkgs, unfreePkgs, ... }:
{
  home.packages = with pkgs; [
    # TMP
		ffmpeg

		# Uni TMP
		unfreePkgs.chatgpt
		openfortivpn
    # zotero
    threema-desktop
    codex
  ];

  imports = [
  ];
}

