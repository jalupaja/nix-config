{ pkgs, theme, ... }:
{
  services.dunst = {
    enable = true;
    settings = {  
      global = {    
        width = 300;    
        height = 300;    
        offset = "10x50";    
        origin = "top-right";    
        # doesn't work 
        transparency = 50;    
        frame_color = "#${theme.color_second}";
        font = "Monospace 8";  
        notification_limit = 0;
        padding = 9;
        horizontal_padding = 8;
        text_icon_padding = 0;
        frame_width = 3;
        separator_color = "frame";
      };  
      urgency_low = {    
        background = "#${theme.background}";
        foreground = "#${theme.foreground}";
        timeout = 3;  
      };
      urgency_normal = {    
        background = "#${theme.background}";
        foreground = "#${theme.foreground}";
        timeout = 3;
      };
      urgency_critical = {    
        background = "#900000";    
        foreground = "#ffffff";    
        frame_color = "#ff0000";
        timeout = 10;  
      };
    };
  };
}
