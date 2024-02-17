#!/bin/sh

 git add .
sudo nixos-rebuild switch --flake .# --show-trace
git restore --staged .
