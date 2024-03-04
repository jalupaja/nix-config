{ pkgs, ... }:
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
      ll = "ls -l";
      la = "ls -la";
      lg = "ls -la | grep ";

      # cd stuff
      doc = "cd ~/Documents";
      dot = "cd ~/.config/jalupa_config/dmenuscripts";
      nix = "cd ~/.config/nix-config";
      ".." = "cd ..";
      "..." = "cd ../..";
      "...." = "cd ../../..";

      # extra aliases
      s="xdg-open";
      emacs="emacsclient -c -a 'emacs' &";
      pss="ps -aux | grep ";
      e="emacsclient -c";
      g="grep";
      mpvs="mpv --shuffle";
      mpvv="mpv --player-operation-mode=pseudo-gui";
      simple_crypt="~/repos/own/simple_crypt/start.sh";
      drag="${pkgs.ripdrag}/bin/ripdrag -b -n";

      # git stuff
      gita = "git add";
      gits = "git status";
      gitc = "git commit -m";
    };

    envExtra = ''
printf "\033c"
printf '\033[0;33m'
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

      caseSensitive = false;
      editor.dotExpansion = true;
    };
  };
}
