{pkgs, ...}:
{
  programs.vim = {
    enable = true;
      #plugins = with pkgs.vimPlugins; [ ];
      settings = {
        ignorecase = true;
      };
      settings = {
          #hlsearch = true;
        };
        settings = {
          tabstop = 4;
        };
        settings = {
          #softtabstop = 4;
        };
        settings = {
          expandtab = true;
        };
        settings = {
          shiftwidth = 4;
        };
        settings = {
          #autoindent = true;
        };
        settings = {
          number = true;
        };
        settings = {
          #set encoding = utf8;
        };
        settings = {
          relativenumber = true;
        };
      };
    }

