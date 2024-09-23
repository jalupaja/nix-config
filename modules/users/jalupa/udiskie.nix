{ pkgs, ... }:
{
  home.packages = with pkgs; [
    udiskie
  ];

  # TODO not working
 services.udiskie = {
   enable = true;
   notify = true;

   automount = true;
   settings = {
     program_options = {
       udisks_version = 2;
       tray = false;
     };
     icon_names.media = [ "media-optical" ];
   };
 };
}
