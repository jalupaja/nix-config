{ pkgs, lib, inputs, ... }: 
{  
  programs.swaylock = {
    enable = true;
    settings = {
      no-unlock-indicator = true;
      color = "303030";  
      indicator-caps-lock = true;
      show-failed-attempts = false;
    };
  };
}
