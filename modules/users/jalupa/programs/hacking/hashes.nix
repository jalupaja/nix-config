{ pkgs, ... }:
{
  home.packages = with pkgs; [
    hashcat # hash cracker
    john # hash extractor/cracker
    cewl # custom wordlist generator
  ];
}
