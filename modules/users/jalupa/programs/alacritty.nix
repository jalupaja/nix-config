{ pkgs, theme, ... }:
{
    programs.alacritty = {
        enable = true;
        settings = {
            scrolling = {
                history = 10000;
                multiplier = 3;
            };

            font = {
                normal.family = "${theme.font}";
                size = 12;

                bold.style = "Bold";
                italic.style = "Italic";
                bold_italic.style = "Bold Italic";
            };

            colors = {
                draw_bold_text_with_bright_colors = true;

                primary = {
                    foreground = "#${theme.foreground}";
                    background = "#${theme.background}";
                };

                normal = {
                    black = "#1a1a1a";
                    blue = "#6d46b2";
                    cyan = "#4fbcd3";
                    green = "#608f16";
                    magenta = "#f4005f";
                    red = "#D64326";
                    white = "#c4c5b5";
                    yellow = "#e5ab00";
                };

                bright = {
                    black = "#625e4c";
                    blue = "#b083ff";
                    cyan = "#58d1eb";
                    green = "#79b31c";
                    magenta = "#f5196f";
                    red = "#EE4B2B";
                    white = "#f6f6ef";
                    yellow = "#FFBF00";
                };
            };

            bell = {
                animation = "EaseOutCirc";
                #duration = 10; # enable
                duration = 0; # disable
                color = "#${theme.foreground}";
                command = "None";
            };

            selection = {
                semantic_escape_chars = ",│`|:\"' ()[]{}<>\t";
                save_to_clipboard = true;
            };

            cursor = {
                style = "Block";

                unfocused_hollow = true;
                thickness = 0.15;
            };

            mouse = {
                hide_when_typing = true;
            };

            # TODO ...
            keyboard.bindings = [
                {
                    key = "J";
                    mods = "Control";
                    chars = "TODO";
                }
            ];
        };
    };
}
