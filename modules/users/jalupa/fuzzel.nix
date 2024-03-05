{ pkgs, globals, ... }:
{  
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {    
        terminal = "${globals.term}";    
        layer = "overlay"; 
        password-character = "*";
        fuzzy = "yes";
        # TODO not implemented yet?
        # anchor = "center";
        lines = 10;
        tabs = 4;
        prompt = ">";
      };  

      colors = {
        background = "030303ee";
        text = "f1f1f1ee";
        selection = "d1d1d1ee";
        selection-text = "030303ee";
        selection-match = "e64c00ff";
        border = "e64c00ff";
      };

      border = {
        width = 2;
        radius = 15;
      };

      dmenu = {
        mode = "text";
      };

      key-bindings = {
        prev = "Up Control+k";
        next = "Down Control+j";
        # TODO doesnt work for some reason
        delete-line = "Control+u";
      };
    };
  };
}
