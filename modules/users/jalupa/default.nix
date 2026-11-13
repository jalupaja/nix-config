{ config, pkgs, pkgs-stable, inputs, theme, ... }:
let
  pkgsStable = pkgs-stable;
  unfreePkgs = import pkgs.path {
    inherit (pkgs.stdenv.hostPlatform) system;
    config = pkgs.config // { allowUnfree = true; };
  };
  unfreePkgsStable = import pkgsStable.path {
    inherit (pkgsStable.stdenv.hostPlatform) system;
    config = pkgsStable.config // { allowUnfree = true; };
  };
in
{
  _module.args = { inherit pkgsStable unfreePkgs unfreePkgsStable; };

  imports = [
    ./programs_default.nix
    ./programs_desktop.nix
    ./programs_optional.nix
    ./programs_extra.nix
    ./programs_art.nix
    ./programs_temp.nix
    ./programs_stable.nix
  ];

  home.username = "jalupa";
  home.homeDirectory = "/home/jalupa";
  home.stateVersion = "26.05"; # TODO should not be needed but is. is in all/default

  # TODO fix
#  systemd.user.services.lemurs = {
#    unitConfig = {
#      after = [ "systemd-user-sessions.service" "plymouth-quit-wait.service" "getty@tty1.service" ];
#      description = "Lemurs";
#    };
#    serviceConfig = {
#      ExecStart = "${pkgs.lemurs}/bin/lemurs";
#      StandardInput = "tty";
#      TTYPath = "/dev/tty1";
#      TTYReset = "yes";
#      TTYVHangup = "yes";
#      Type = "idle";
#    };
#    installConfig = {
#      alias = "display-manager.service";
#    };
#  };
}
