{ pkgs, colors, ... }:
{
  lock = pkgs.pkgs.writeShellScript "lock" ''
      swaylock \
    --screenshots \
    --clock \
    --indicator \
    --indicator-radius 100 \
    --indicator-thickness 7 \
    --effect-blur 7x10 \
    --effect-vignette 0.5:0.5 \
    --ring-color ${colors.second} \
    --key-hl-color ${colors.second} \
    --text-color ${colors.main} \
    --line-color 00000000 \
    --inside-color 00000088 \
    --separator-color 00000000 \
    --text-ver "..." \
    --fade-in 0.3
    # key-hl-color = indicator-color on clicked
  '';
}
