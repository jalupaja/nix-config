{nur, inputs, ...}:
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
}
