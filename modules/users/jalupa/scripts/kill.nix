{ pkgs, globals, ... }:
{
  kill = pkgs.pkgs.writeShellScript "kill" ''
    DMENU="${globals.dmenu}"

    processes=$(ps axo user,pid,args | sed -n -e "s/$USER\s*//p")

    choice=$(echo -e "$processes" | $DMENU)

    if [ -n "$choice" ]; then
        kill -9 $(echo -e "$choice" | awk -e '{print $1}')
    fi
'';
}
