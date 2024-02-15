{nur, pkgs, inputs, ...}:
{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = {
      inherit inputs;
      addons = nur.repos.rycee.firefox-addons;
    };
    users = {
      jalupa = import ./users/jalupa;
    };
  };

  # TODO move and prob a better way to do this
  users.users.jalupa.ignoreShellProgramCheck = true;
  users.users.jalupa.shell = pkgs.zsh;
}
