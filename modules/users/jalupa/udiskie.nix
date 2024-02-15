{ pkgs, ... }:
{
  # TODO not working
  services.udiskie = {
    enable = true;
    tray = "never";  
  };
}
