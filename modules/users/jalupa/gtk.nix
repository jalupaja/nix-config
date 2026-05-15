{pkgs, theme, ...}: {
  gtk = {
    enable = true;

    gtk4.theme = null; # enable new default behaviour on current, old nix stateVersion
    font = {
         name = "${theme.font}";
    };

    iconTheme = {
        name = "Papirus-Dark";
        package = pkgs.catppuccin-papirus-folders.override {
            flavor = "mocha";
            accent = "lavender";
        };
    };

    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };

    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
  };
}
