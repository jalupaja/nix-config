{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # overall dev utils
    clang
  ];

  imports = [
    ./c.nix
    #./rust.nix
    ./python.nix
		./java.nix
		# TODO test
		#./pytest.nix
  ];
}
