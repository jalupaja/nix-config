{ pkgs, ... }:
{
  programs.foot = {
    enable = true;

    settings = {
      main = {
        shell = "/usr/bin/env bash";
      };
    };
  };
}
