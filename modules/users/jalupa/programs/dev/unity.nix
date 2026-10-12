{ pkgs, ... }:
{
  home.packages = with pkgs; [
    (unityhub.override {
      # extraPkgs = fhsPkgs: [
      #   fhsPkgs.harfbuzz
      #   fhsPkgs.libogg
      # ];
    })
  ];
}
