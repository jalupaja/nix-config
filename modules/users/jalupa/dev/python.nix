{ pkgs, ... }:
{
  home.packages = with pkgs; [
		ruff
    (python3.withPackages (python-pkgs: with python-pkgs; [
      requests
      virtualenv

			bleak
			pyqt6
			numpy
			pandas
    ]))
  ];
}
