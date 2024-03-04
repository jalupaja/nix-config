{ pkgs, colors, ... }:
{
  services.mako = {
    enable = true;

    backgroundColor = "#${colors.background}FF";
    textColor = "#${colors.foreground}FF";
    progressColor = "over #${colors.foreground}FF";
    borderColor = "#${colors.second}FF";
    borderRadius = 4;

    defaultTimeout = 3000;
    padding = "20";
    height = 600; # max height
    width = 200;
  };
}
