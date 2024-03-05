{ pkgs, theme, ... }:
{
    programs.alacritty = {
    # https://github.com/LoneWolf4713/auspicious-dots/blob/main/alacritty/alacritty.toml
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
                    foreground = "0x${theme.foreground}";
                    background = "0x${theme.background}";
                };

                normal = {
                    black = "0x3B4252";
                    red = "0xBF616A";
                    green = "0xA3BE8C";
                    yellow = "0xEBCB8B";
                    blue = "0x81A1C1";
                    magenta = "0xB48EAD";
                    cyan = "0x88C0D0";
                    white = "0xE5E9F0";
                };

                bright = {
                    black = "0x4C566A";
                    red = "0xBF616A";
                    green = "0xA3BE8C";
                    yellow = "0xEBCB8B";
                    blue = "0x81A1C1";
                    magenta = "0xB48EAD";
                    cyan = "0x8FBCBB";
                    white = "0xECEFF4";
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
