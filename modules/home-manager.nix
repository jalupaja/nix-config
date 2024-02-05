{nur, ...}:
{
	home-manager = {
		useGlobalPkgs = true;
		useUserPackages = true;
		extraSpecialArgs = {
			addons = nur.repos.rycee.firefox-addons;
		};
		users = {
			jalupa = import ./users/jalupa;
		};
	};
}
