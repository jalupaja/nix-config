{ pkgs, ... }:
{
  home.packages = [
    (pkgs.python3.withPackages (python-pkgs: with python-pkgs; [
      requests
      virtualenv

			bleak
			pyqt6
			numpy
			pandas
    ]))
  ];
}
