{ pkgs, lib, config, inputs, ... }: 
{
  programs.wpaperd = {
    enable = true;

    settings = {
      default = {
        duration = "1m";
        path = "/home/jalupa/.wallpapers/nerd-linux";
        apply-shadow = true;
        sorting = "random";
      };
    };
  };
}
