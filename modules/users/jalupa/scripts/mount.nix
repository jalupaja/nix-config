{ pkgs, globals, ... }:
{
  mount = pkgs.pkgs.writeShellScript "mount" ''

DMENU="${globals.dmenu}"

get_disks()
{
    get_parts | sed -n '/^.*[0-9]. *$/p' | sed -n '/^disk\s*/p' | awk '{print $2 " " $3}' | column -t
}

get_parts()
{
    lsblk -e 7 -o TYPE,NAME,SIZE,MOUNTPOINTS -l | tail -n +2
}

get_mountable()
{
    get_parts | sed -n '/^.*[0-9]. *$/p' | sed -n '/^part\s*/p' | awk '{print $2 " " $4 " " $3}' | column -t
}

get_unmountable()
{
    get_parts | sed '/^.*[0-9]. *$/d' | sed -n '/^part\s*/p' | awk '{print $2 " " $4 " " $3}' | column -t
}

mnt()
{
    udisksctl mount -b /dev/$1
}

umnt()
{
    udisksctl unmount -b /dev/$1
}

eject()
{
    udisksctl power-off -b /dev/$1
}

getopts "mue" flag
case "''${flag}" in
    e) # eject
    to_ejec=$(get_disks | $DMENU " mount " | awk '{print $1}')

	if [ -n "$to_ejec" ];
	then
        readarray -t to_umnt < <(get_unmountable | grep "^$to_ejec*" | awk '{print $1}')

        for umnt in "''${to_umnt[@]}"
        do
            umnt "$umnt"
        done

	    eject "$(echo -e $to_ejec | awk '{print $1}')"
	fi
	if [ $? -ne 0 ];
	then
	    notify-send -a "umount" "Ejecting failed!"
	fi
	;;
    u) # umount
	to_umnt=$(get_unmountable | $DMENU " umount ")

	if [ -n "$to_umnt" ];
	then
        umnt "$(echo -e $to_umnt | awk '{print $1}')"
	fi
	if [ $? -ne 0 ];
	then
	    notify-send -a "umount" "Unmounting failed!"
	fi
	;;
    m | *) # default is mount
	to_mnt=$(get_mountable | $DMENU " mount ")

	if [ -n "$to_mnt" ];
	then
	    mnt "$(echo -e $to_mnt | awk '{print $1}')"
	fi
	if [ $? -ne 0 ];
	then
	    notify-send -a "mount" "Mounting failed!"
	fi
	;;
esac
'';
}
