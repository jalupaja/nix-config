{ pkgs, ... }:
{
  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    geist-font
    liberation_ttf
    nerd-fonts.jetbrains-mono # https://www.nerdfonts.com/font-downloads
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
    liberation_ttf
    ipafont
    kochi-substitute
  ];
}
