# nix-config
> My configuration for NixOS and many of my programs using home-manager

## Programs
My home-manager files can be found in `./modules/users/jalupa` \
I am using:
- Hyprland as a Window Manager
- Waybar as a Bar
- Rofi as my run Manager and dmenu replacement
- Alacritty as my Terminal Manager with Foot as a Backup
- Neovim (NixVim) as my Editor
- Firefox as my Browser with Brave as a Backup
- many more programs
The global programs can be changed in `./modules/users/jalupa/globals.nix`
> (This may not 100% apply to all files)

## DMENU
> I am using rofi as a dmenu replacement

My dmenu scripts can be found in `./modules/users/jalupa/scripts` \
The .nix files can easily be rewritten into bash files

## Colors
The colortheme can be changed in `./modules/users/jalupa/theme.nix`
