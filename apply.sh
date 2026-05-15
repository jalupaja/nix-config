#!/bin/sh

git add .
# ".#debian" to install on a new system
sudo nixos-rebuild switch --flake .# --show-trace
# sudo nixos-rebuild boot --flake .# --show-trace
git restore --staged .
