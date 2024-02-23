#!/usr/bin/env bash

colorMain=e64c00
colorSecond=9933ff

swaylock \
    --screenshots \
    --clock \
    --indicator \
    --indicator-radius 100 \
    --indicator-thickness 7 \
    --effect-blur 7x10 \
    --effect-vignette 0.5:0.5 \
    --ring-color $colorSecond \
    --key-hl-color $colorSecond \
    --text-color $colorMain \
    --line-color 00000000 \
    --inside-color 00000088 \
    --separator-color 00000000 \
    --text-ver "..." \
    --grace 1.5 \
    --fade-in 0.2
# key-hl-color = indicator-color on clicked
