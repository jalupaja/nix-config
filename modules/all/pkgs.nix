{pkgs, ...}:
{
environment.systemPackages = with pkgs; [
vim
neofetch
wget
git
sshfs
];
}
