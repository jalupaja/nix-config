{ pkgs, colors, ... }:
{
  killall = pkgs.pkgs.writeShellScript "killall" ''

    DMENU="rofi -dmenu"
    processes=$(ps axo user,comm | sed -n -e "s/$USER\s*//p" | sort | uniq)


    choice=$(echo "$processes" | $DMENU)

    if [ -n "$choice" ]; then
        killall $choice
    fi
  '';
}
