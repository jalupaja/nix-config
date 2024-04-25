{ pkgs, theme, globals, ... }:
{
  programs.zsh = {
    enable = true;

    autocd = true;
    defaultKeymap = "emacs";
    syntaxHighlighting = {
      enable = true;
    };

    shellAliases = {
      #healthy defaults
      cp = "cp -i";
      mv = "mv -i";
      df="df -h";
      du="du -h";
      free="free -m";
      mount="sudo mount -o uid=$USER";
      umount="sudo umount";
      grep="grep -i --colour=auto";

      # ll stuff
      ll = "ls -lh";
      la = "ls -lah";
      lg = "ls -lah | grep ";

      # cd stuff
      cdd = "cd ~/Documents";
      cdn = "cd ~/.config/nix-config";
      cdnh = "cd ~/.config/nix-config/modules/users/jalupa";
      cdu = "cd ~/Documents/Uni/6.\\ Semester";
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
      simple_crypt="~/repos/own/simple_crypt/start.sh";
      drag="${pkgs.ripdrag}/bin/ripdrag -b -n";
      term="${globals.term} &";

      # git stuff
      gita = "git add";
      gits = "git status";
      gitc = "git commit -m";
    };

		envExtra = ''
# Session Variables
export LD_LIBRARY_PATH="${pkgs.stdenv.cc.cc.lib}/lib/:/run/opengl-driver/lib/";
		'';

    initExtra = ''
# bindkeys
bindkey '^H' backward-kill-word

# Functions
calc()
{
    echo "$1" | bc -l
}

printf '\e]4;1;rgb:${theme.color_second}\e\\\e[31m'
date=$(date | awk '{print $4}')
printf "%*s\n" $(((''${#date}+$COLUMNS)/2)) "$date"
unset date

printf '\e]4;1;rgb:${theme.color_first}\e\\\e[31m'

echo '
       ___  ________  ___       ___  ___  ________  ________
      |\  \|\   __  \|\  \     |\  \|\  \|\   __  \|\   __  \
      \ \  \ \  \|\  \ \  \    \ \  \\\\\  \ \  \|\  \ \  \|\  \
    __ \ \  \ \   __  \ \  \    \ \  \\\\\  \ \   ____\ \   __  \
   |\  \\\_\  \ \  \ \  \ \  \____\ \  \\\\\  \ \  \___|\ \  \ \  \
   \ \________\ \__\ \__\ \_______\ \_______\ \__\    \ \__\ \__\
    \|________|\|__|\|__|\|_______|\|_______|\|__|     \|__|\|__|

'
    '';

    prezto = {
      enable = true;

      color = true;
      caseSensitive = false;
      editor = {
        dotExpansion = true;
      };

      prompt = {
        pwdLength = "short";
      };

      utility = {
        safeOps = false;
      };
    };
  };
}
