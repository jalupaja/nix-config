{nur, pkgs, inputs, lib, config, ...}:
{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = rec {
      inherit inputs;
      theme = import ./users/jalupa/theme.nix;
      globals = import ./users/jalupa/globals.nix {inherit pkgs;};
      scripts = import ./users/jalupa/scripts{inherit pkgs lib config;};
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
