# {pkgs, ...}:
{
  virtualisation.docker = {
    enable = true;

    rootless = {
      enable = true;
      setSocketVariable = true;
    };
  };
  users.users.jalupa.extraGroups = [ "docker" ];
}
