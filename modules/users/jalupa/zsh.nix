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
      ll = "ls -l";
      la = "ls -la";
      lg = "ls -la | grep ";

      # cd stuff
      doc = "cd ~/Documents";
      dot = "cd ~/.config/jalupa-config/dmenuscripts";
      nix = "cd ~/.config/nix-xonfig";
      ".." = "cd ..";
      "..." = "cd ../..";
      "...." = "cd ../../..";

      #healthy defaults
      cp = "cp -i";
      mv = "mv -i";
      emacs="emacsclient -c -a 'emacs' &";
      e="emacsclient -c";
      pss="ps -aux | grep ";
      mpvv="mpv --player-operation-mode=pseudo-gui";
      grep="grep --colour=auto";
      g="grep";
      df="df -h";
      du="du -h";
      free="free -m";
      mount="sudo mount -o uid=$USER";
      umount="sudo umount";
      simple_crypt="~/repos/own/simple_crypt/start.sh";

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
