{ pkgs, ... }:
{
  home.packages = with pkgs; [
    android-tools
    # frida-tools
  ];
}
