{ pkgs, ... }:
{
  home.packages = with pkgs; [
    clang
    cargo
    rustc
  ];
}
