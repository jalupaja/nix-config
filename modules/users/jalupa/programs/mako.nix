{ pkgs, theme, ... }:
{
  services.mako = {
    enable = true;

    backgroundColor = "#${theme.background}FF";
    textColor = "#${theme.foreground}FF";
    progressColor = "over #${theme.foreground}FF";
    borderColor = "#${theme.color_first}FF";
    borderRadius = 4;

    defaultTimeout = 3000;
    padding = "20";
    height = 600; # max height
    width = 200;
  };
}
