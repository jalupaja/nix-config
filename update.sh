#!/bin/sh
nix flake update --commit-lock-file
./apply.sh
