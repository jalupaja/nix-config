{ pkgs, ... }:
{
  home.packages = with pkgs; [
		jdk # probablly already installed as it is often needed outside of development
    jre
    maven
  ];
}
