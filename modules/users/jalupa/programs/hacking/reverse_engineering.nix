{ pkgs, ... }:
{
  home.packages = with pkgs; [
    ghidra-bin
    jadx # java decompiler
    # frida-tools
  ];
}
