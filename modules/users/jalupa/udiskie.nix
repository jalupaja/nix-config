{ pkgs, ... }:
{
  # TODO not working
  services.udiskie = {
    enable = true;

    settings = {  
      program_options = {    
        udisks_version = 2;    
        tray = true;  
      };  
      icon_names.media = [ 
        "media-optical" 
      ];
    };
  };
}
