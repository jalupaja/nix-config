#!/bin/sh

git add .
# ".#debian" to install on a new system
sudo nixos-rebuild switch --flake .# --show-trace --no-build-nix
git restore --staged .
