{pkgs, ...}:
{
  environment.systemPackages = with pkgs; [
    vim
    neofetch
    wget
    git
    htop
    pulseaudio
  ];
}
