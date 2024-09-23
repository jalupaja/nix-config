{ ... }:
{
 services.udiskie = {
   enable = true;
   notify = true;
   automount = false;

   settings = {
     program_options = {
       udisks_version = 2;
       tray = true;
     };
   };
 };
}
