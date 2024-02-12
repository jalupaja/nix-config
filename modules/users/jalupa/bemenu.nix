{pkgs, ...}:
{
  programs.bemenu = {
    enable = true;
    # TODO settings not used when calling bemenu
    settings = {
      ignorecase = true;  
      list = true;
      center = true;
      binding = "vim";
      fb = "#1e1e2e";  
      ff = "#cdd6f4";  
      nb = "#1e1e2e";  
      nf = "#cdd6f4";  
      tb = "#1e1e2e";  
      hb = "#1e1e2e";  
      tf = "#f38ba8";  
      hf = "#f9e2af";  
      af = "#cdd6f4";  
      ab = "#1e1e2e";  
      width-factor = 0.3;
    };
  };
}
