# OPTIONAL DEPENDENCIES
{ pkgs, ... }:
{
  home.packages = with pkgs; [
    p7zip
    texliveFull # LaTeX
    typst
    exiftool # metadata
    jdk # java
    fastfetch
    yt-dlp
  ];
  imports = [
		# browser
    ./programs/firefox.nix
		# terminal emulators
    ./programs/alacritty.nix
    ./programs/wezterm.nix
    #./programs/kitty.nix
    ./programs/foot.nix # backup terminal
		# editors
    ./programs/vim.nix
    ./programs/nixvim.nix # neovim
    #./programs/neovim.nix
    #./programs/emacs.nix
    #./programs/emacs-overlay.nix
    #./programs/doom-emacs
		# media viewers
    ./programs/mpv.nix # music/video
    ./programs/pqiv.nix # images
		./programs/zathura.nix # (pdf) documents
		# terminal extras
    ./programs/starship.nix
		#./programs/yazi.nix # tui file manager
		# development extras
    ./programs/dev
    # security/hacking research
    ./programs/hacking
    # ./programs/games.nix
  ];
}
