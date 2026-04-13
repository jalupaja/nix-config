# in combination with /modules/all/kvm.nix
{ pkgs, ... }:
{
  home.packages = with pkgs; [
    dnsmasq
  ];
}
