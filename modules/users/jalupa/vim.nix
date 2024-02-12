{ pkgs, ... }: {
  programs.vim = {
    enable = true;
    #plugins = with pkgs.vimPlugins; [ ];
    settings = {
      ignorecase = true;
      #hlsearch = true;
      tabstop = 4;
      #softtabstop = 4;
      expandtab = true;
      shiftwidth = 4;
      #autoindent = true;
      number = true;
      #"set encoding" = "utf8";
      relativenumber = true;
    };
  };
}

