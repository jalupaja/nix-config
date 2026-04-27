{ pkgs, ... }:
{
  home.packages = with pkgs; [
  ];

  imports = [
    ./hashes.nix
    ./network_enumeration.nix
    ./network_exploitation.nix
    ./reverse_engineering.nix
    ./web_enumeration.nix
    ./wifi_exploitation.nix
  ];
}
