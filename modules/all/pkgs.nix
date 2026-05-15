{pkgs, ...}:
{
  environment.systemPackages = with pkgs; [
    vim
    wget
    git
    htop
    pulseaudio
  ];
}
