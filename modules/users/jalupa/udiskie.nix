{ pkgs, ... }:
{
  home.packages = with pkgs; [
    udiskie
  ];

  # TODO not working
#  services.udiskie = {
#    enable = true;
#    notify = true;
#
#    automount = true;
#    settings = {
#      program_options = {
#        udisks_version = 2;    
#        tray = false;  
#      };  
#      icon_names.media = [ "media-optical" ];
#    };
#  };

systemd.user.services.udiskie = {
  unitConfig = {
    description = "Mounts disks in userspace with udisks";
  };
  # https://discourse.nixos.org/t/how-to-start-systemd-services-provided-by-packages-installed-through-nix-on-an-alien-distro/23056/7

  serviceConfig = {
    ExecStart = ''
        ${pkgs.udiskie}/bin/udiskie \
        -2                        \
        --smart-tray              \
        --automount               \
        --no-config               \
        --no-password-cache       \
        --no-notify               
    '';
    #--password-prompt ${pkgs.lxqt.lxqt-openssh-askpass}/bin/lxqt-openssh-askpass
    Type    = "simple";
    Restart = "always";
  };
};
}
