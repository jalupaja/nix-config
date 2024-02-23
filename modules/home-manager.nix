{nur, pkgs, inputs, lib, ...}:
{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = {
      inherit inputs;
      colors = import ./users/jalupa/colors.nix;
      scripts = import ./users/jalupa/scripts{inherit pkgs lib;};
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
