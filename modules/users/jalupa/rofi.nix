{pkgs, config, colors, ...}:
{
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;

    cycle = true;
    location = "top";
    terminal = "${pkgs.kitty}/bin/kitty";
    # this theme is heavenly influenced by dracula: https://github.com/dracula/rofi/blob/main/theme/config1.rasi

    extraConfig = {
      scroll-method = 1;
    };

    theme = let  
      inherit (config.lib.formats.rasi) mkLiteral;
    in {  
      "configuration" = {
        show-icons = true;
        display-drun = "";
        disable-history = false;
      };

      "*" = {    
        font = "Monospace 12";
        text-color = mkLiteral "#f8f8f2";
        background-color = mkLiteral "#00000099";    
        active-background = mkLiteral "#${colors.main}ff";
        urgent-background = mkLiteral "#ffcccbff";
        urgent-text-color = mkLiteral "#8b0000";
        selected-background = mkLiteral "@active-background";
        selected-urgent-background = mkLiteral "@urgent-background";
        selected-active-background = mkLiteral "@active-background";
        separatorcolor = mkLiteral "@active-background";

        border-color = mkLiteral "#${colors.second}";
        width = 512;  
      };  

      "#window" = {
        background-color = mkLiteral "@background-color";
        border = 3;
        border-radius = 7;
        border-color = mkLiteral "@border-color";
        padding = 10;
      };

      "#mainbox" = {
        border = 0;
        padding = 0;
      };

      "#message" = {
        border = 0;
        padding = mkLiteral "1px";
      };

      "#textbox" = {
        text-color = mkLiteral "@text-color";
      };

      "#listview" = {
        spacing = mkLiteral "2px";
        scrollbar = false;
      };

      "#element" = {
        padding = mkLiteral "3px";
        background-color = mkLiteral "@background-color";
        text-color = mkLiteral "@text-color";
        border-radius = mkLiteral "5px";
      };
      "#element.normal.normal" = {
        background-color = mkLiteral "@background-color";
        text-color = mkLiteral "@text-color";
      };
      "#element.normal.urgent" = {
        background-color = mkLiteral "@urgent-background";
        text-color = mkLiteral "@urgent-text-color";
      };
      "#element.normal.active" = {
        background-color = mkLiteral "@background-color";
        text-color = mkLiteral "@text-color";
        border = mkLiteral "3px";
        border-color = mkLiteral "@border-color";
      };
      "#element.selected.normal" = {
        background-color = mkLiteral "@selected-background";
        text-color = mkLiteral "@text-color";
      };
      "#element.selected.urgent" = {
        background-color = mkLiteral "@selected-urgent-background";
        text-color = mkLiteral "@text-color";
      };
      "#element.selected.active" = {
        background-color = mkLiteral "@selected-active-background";
        text-color = mkLiteral "@text-color";
      };
      "#element.alternate.normal" = {
        background-color = mkLiteral "@background-color";
        text-color = mkLiteral "@text-color";
      };
      "#element.alternate.urgent" = {
        background-color = mkLiteral "@urgent-background";
        text-color = mkLiteral "@text-color";
      };
      "#element.alternate.active" = {
        background-color = mkLiteral "@background-color";
        text-color = mkLiteral "@text-color";
      };

      "#scrollbar" = {
        width = mkLiteral "2px";
        handle-width = mkLiteral "8px";
      };

      "#sidebar" = {
        border = mkLiteral "2px dash 0px 0px";
        border-color = mkLiteral "@separatorcolor ";
      };

      "#button.selected" = {
        background-color = mkLiteral "@selected-background";
        text-color = mkLiteral "@text-color";
      };

      "#inputbar" = {
        spacing = 0;
        text-color = mkLiteral "@text-color";
        padding = mkLiteral "1px";
        # TODO fix textbox-prompt-colon
        children = map mkLiteral [ "prompt" "textbox-prompt-colon" "entry" "case-indicator" ];
        #children = map mkLiteral [ "prompt" "textprompt" "textbox-prompt-colon" "entry" "case-indicator" ];
      };

      "#case-indicator" = {
        spacing = 0;
        text-color = mkLiteral "@text-color";
      };

      "#entry" = {
        spacing = 0;
        text-color = mkLiteral "@text-color";
      };

      "#prompt" = {
        spacing = 0;
        text-color = mkLiteral "@text-color";
      };

      "#textbox-prompt-colon" = {
        background-color = mkLiteral "@background-color";
        expand = false;
        str = ">";
        # expand doesnt seem to work but this does
        width = mkLiteral "1em";
        text-color = mkLiteral "@text-color";
      };

      "#element-text, element-icon" = {
        background-color = mkLiteral "inherit";
        text-color = mkLiteral "inherit";
      };
    };
  };
}