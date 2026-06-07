{ pkgs, theme, globals, ... }:
{
  programs.bash = {
    enable = true;
    historyFile = null;

    # TODO use same as zsh, automatically
    shellAliases = {
      #healthy defaults
      cp = "cp -i";
      mv = "mv -i";
      df="df -h";
      du="du -h";
      free="free -m";
      mount="udisksctl mount -b";
      # mount="sudo mount -o uid=$USER";
      umount="udisksctl unmount -b";
      # umount="sudo umount";
      grep="grep -i --colour=auto";
			rg="rg -i";

      # ll stuff
      ll = "ls -lh";
      la = "ls -lah";
      lg = "rg --files --hidden | rg -i";

      # cd stuff
      cdd = "cd ~/Documents";
      cdn = "cd ~/.config/nix-config";
      cdnh = "cd ~/.config/nix-config/modules/users/jalupa";
      cdu = "cd ~/Documents/Uni/3.\\ Master";
      ".." = "cd ..";
      "..." = "cd ../..";
      "...." = "cd ../../..";

      # extra aliases
      s="xdg-open";
      emacs="emacsclient -c -a 'emacs' &";
      vim="nvim";
      pss="ps -aux | grep ";
      e="emacsclient -c";
      g="grep";
      mpvs="mpv --shuffle";
      mpvv="mpv --player-operation-mode=pseudo-gui";
      drag="${pkgs.ripdrag}/bin/ripdrag -b -n";
      term="${globals.term} start --cwd . 2&>/dev/null";
			nix-shell="${pkgs.nix-output-monitor}/bin/nom-shell";
			mount_phone="${pkgs.jmtpfs}/bin/jmtpfs";

      # git stuff
      gita = "git add";
      gits = "git status";
      gitc = "git commit -m";
      gitd = "git diff --ignore-all-space";
      gitds = "git diff --staged --ignore-all-space";
      gitdw = "git diff";
      gitdsw = "git diff --staged";
    };

    bashrcExtra = ''
# Functions
calc()
{
    echo "$1" | bc -l
}

alarm()
{
  sleep $(echo "$1 * 60" | bc)
  for i in $(seq 1 10); do
    notify-send -u 'critical' "NOW " $i
  done
}

simple_crypt()
{
  cd ~/repos/simple_crypt
  nix-shell --run "python simple_crypt.py -- $@"
}

cpRAW()
{
  # copy raw images, matching current exports from parent folder to current folder
  jpgFiles=($(\ls -1 *.jpg))
  cp $(echo "''${jpgFiles[@]}" | sed -e 's/jpg/ARW/ig' | sed -e 's/ / ..\//g' | sed -e 's/^/..\//') .
}

mvRAW()
{
  # copy raw images, matching current exports from parent folder to current folder
  jpgFiles=($(\ls -1 *.jpg))
  mv $(echo "''${jpgFiles[@]}" | sed -e 's/jpg/ARW/ig' | sed -e 's/ / ..\//g' | sed -e 's/^/..\//') .
}

# penetration testing setup
wl="$HOME/Documents/CTFs/wordlists"

    '';
  };
}

